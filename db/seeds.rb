
User.create([
{
	id: 1, 
	first: 'Christy', 
	last: 'Kusuma', 
	username: 'ckusuma', 
	password: 'nycda1'
}, {
	id: 2, 
	first: 'Vikki', 
	last: 'Braxton', 
	username: 'vbraxtvi', 
	password: 'nycda2'
}])

Restaurant.create([
{
	id: 1, 
	name: 'Open Kitchen', 
	order: 'Sushi'
}, {
	id: 2, 
	name: 'Grk', 
	order: 'Portobello griller'
}])

Rating.create([
{
	id: 1, 
	user_id: 1, 
	restaurant_id: 1, 
	rating: 3,
	has_been: true
}, {
	id: 2, 
	user_id: 2, 
	restaurant_id: 2, 
	rating: 4,
	has_been: true
}])

