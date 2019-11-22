# create object
x = 1:9
# what is it's length
length(x)
class(x)

y = sqrt(x)
class(y)
y

zone_names = c("armley", "chaltown", "headingly") 
length(zone_names)
zone_names = rep(x = zone_names, 3)
length(zone_names)
class(zone_names)

d = data.frame(zone_names, x, y)
d$pop = d$x ^ 2 + 100 * 2
m = lm(formula = pop ~ x, data = d)
summary(m)

plot(d$x, d$pop)
d$fitted = m$fitted.values
lines(d$x, d$fitted)

library(pct)
od_wy = pct::get_od(region = "west-yorkshire")
od_leeds = od_wy %>% 
  filter(la_1 == "Leeds") %>% 
  filter(la_2 == "Leeds") %>% 
  filter(all > 100) %>% 
  filter(geo_code1 != geo_code2) 
readr::write_csv(od_leeds, "od_leeds_50plus.csv")
piggyback::pb_upload("od_leeds_50plus.csv")
