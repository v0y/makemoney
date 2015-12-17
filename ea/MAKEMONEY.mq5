//+------------------------------------------------------------------+
//|                                                   MAKE MONEY.mq5 |
//|                                                              voy |
//|                                                 http://lolwtf.pl |
//+------------------------------------------------------------------+
#property copyright "voy"
#property link      "http://lolwtf.pl"
#property version   "1.0"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   Print("Hello world!");
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   Print("no elo");
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  { 
   MqlTick last_tick;

   string request_json = "";
   string cookie = NULL;
   int timeout = 3000;
   char response[];
   int status_code;
   uchar get[];
   string headers = "Content-Type: application/json;";
   ushort request_data[1];
//---
   if(SymbolInfoTick(Symbol(),last_tick))
     {
      StringConcatenate(
         request_json,
         "{",
         "\"time\":\"", last_tick.time, "\",",
         "\"bid\":", last_tick.bid, ",",
         "\"ask\":", last_tick.ask, ",",
         "\"volume\":", last_tick.volume,
         "}" 
      );

      ArrayFill(request_data, 0, 0, request_json)
      
      status_code = WebRequest(
         "POST",
         "http://127.0.0.1:8069/",
         cookie,
         NULL,
         timeout,
         request_data,
         0,
         get,
         headers
      );
      Print(status_code);

     } 
   else Print("SymbolInfoTick() failed, error = ",GetLastError()); 
  }
//+------------------------------------------------------------------+
