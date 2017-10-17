
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
	username: 'vbraxton', 
	password: 'nycda2'
}])

Restaurant.create([
{
	id: 1, 
	name: 'Open Kitchen', 
	order: 'Salmon, salad, chicken'
}, {
	id: 2, 
	name: 'Grk', 
	order: 'Portobello griller, frozen yogurt'
}])

Rating.create([
{
	id: 1, 
	user_id: 1, 
	restaurant_id: 1, 
	rating: 5,
	review: "Lots of great options!",
	has_been: true
}, {
	id: 2, 
	user_id: 2, 
	restaurant_id: 2, 
	rating: 4,
	review: "Really filling.",
	has_been: true
}])

