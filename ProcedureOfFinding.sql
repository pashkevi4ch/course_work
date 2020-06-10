CREATE PROCEDURE FindEstate
    @priceunder decimal(18,10),
    @type NVARCHAR(50),
    @numberofbedrooms INT,
	@petsallowed bit,
    @floor_space float
AS
select price, parking_capacity, type, pets_allowed, floor_space, number_of_bedrooms, number_of_bathrooms, street, house, appartment
From sat_estate
join link_estate_place on
id_estate = sat_estate.id
join sat_place on
id_place = sat_place.id
where price <= @priceunder and type = @type and number_of_bedrooms >= @numberofbedrooms and pets_allowed = @petsallowed and floor_space >= @floor_space

