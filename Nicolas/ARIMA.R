# 5 STEP METHOD to make prediction on pure non-deterministic time series (y = f(t))
 t_v = air_visit$visit_datetime
 v = air_visit$visitors
 t_r = air_reserve$reserve_datetime
 r = air_reserve$reserve_visitors
 t_vr = air_reserve$visit_datetime#soit 3 timeseries

 # Difficulté: prédire pour chaque resto ou chaque type de resto...
 # ==> trop de time series à étudier
 
 # Convert to time series (doit etre class ts)
 
 
 # 1st step: explore and visualize time series
 print("debut:")
 print(start(t_v))
 print("fin:")
 print(end(t_v))
 
 