
--ALL ROUTES
select * from route;

--ALL busstops from ROUTE 100
select *
from route
inner join routedetail on routedetail.CODE = route.CODE
where route.CODE = 100;

--All busstop from Route with detailed info Stops and Adresses
select route.code, station.name, routedetail.ORDER_NR, address.STREET, address.ZIP_CODE, address.CITY
from route
inner join routedetail on routedetail.CODE = route.CODE
inner join station on station.STOP_ID = routedetail.STOP_ID
inner join address on address.ADDRESS_ID = station.ADDRESS_ID
where route.CODE = 100;

-- for names of the bus drivers

select *
from driver
inner join bus on driver.DRIVER_ID = bus.DRIVER_ID;


--for all routes with busses and driver name
select *
from route
inner join bus on route.BUS_ID = bus.BUS_ID
inner join driver on driver.DRIVER_ID = bus.DRIVER_ID

--more specific data
select route.source, route.DESTINATION, driver.FIRST_NAME, driver.LAST_NAME, bus.LICENSE_NR, bus.MODEL
from route
inner join bus on route.BUS_ID = bus.BUS_ID
inner join driver on driver.DRIVER_ID = bus.DRIVER_ID

