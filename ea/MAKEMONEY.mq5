//+------------------------------------------------------------------+
//|                                                   MAKE MONEY.mq5 |
//|                                                              voy |
//|                                                 http://lolwtf.pl |
//+------------------------------------------------------------------+
#property copyright "voy"
#property link      "http://lolwtf.pl"
#property version   "0.1.0"
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
   string json_data;
//--- 
   if(SymbolInfoTick(Symbol(),last_tick))
     {
      request_data = "";
      StringConcatenate(
         json_data, 
         "{",
         "\"time\":\"", last_tick.time, "\",",
         "\"bid\":", last_tick.bid, ",",
         "\"ask\":", last_tick.ask, ",",
         "\"volume\":", last_tick.volume,
         "}" 
      );
      
      Print(request_data);
     } 
   else Print("SymbolInfoTick() failed, error = ",GetLastError()); 
  }
//+------------------------------------------------------------------+
