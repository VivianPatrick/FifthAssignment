// use Inventory_db

//switched to db Inventory_db

// creating collections
db.createCollection("users", {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         title: "User Object Validation",
         required: [ "username", "password"],
         properties: {
            username: {
               bsonType: "string",
               description: "'username' must be a string and is required"
            },
            password: {
               bsonType: "string",
               description: "password must be a string and is required"
            },
            
         }
      }
   }
} )


db.createCollection('admin')
db.createCollection('customers')
db.createCollection('product')
db.createCollection('category')
db.createCollection('orders')

// inserting data into collections
db.users.insertOne({id: 1, username: 'Vivian Patrick', password: 'Vivian123'});
db.admin.insertOne([{_id: 2, Fisrtname: 'Joy', Lastname: 'Lucky', email_address: 'Joy@gamail.com', phone_number: 0814567345, home_address: 'markus strt Abuja', country: 'Nigeria', user_id: 3}]);
db.customers.insertOne({_id: 1, Fisrtname: 'Mark', Lastname: 'Paul', email_address: 'Mark@gamail.com', phone_number: 0705261345, home_address: 'fals strt Abuja', country: 'Nigeria', user_id: 1});
db.category.insertOne({_id:1, name: 'fish', description:'Food'});
db.product.insertOne({_id:1, name: 'shoes', size: 36, price: 8000, brand: 'Nike', description: 'fashion', quantity: 2, category_id: 1, customer_id: 2 });
db.orders.insertOne({_id:1, status: 'Completed', payment_status:'successful', customer_id: 1, product_id: 2});

//getting data from collections
db.users.find({_id: 2})
db.admin.findOne({_id: 1})
db.product.find({_id: 1})

//updating data in collections
db.product.updateOne({_id: 2} ,{$set:{brand: 'Adidas'}});
db.admin.updateOne({_id: 1} ,{$set:{Lastname: 'Joshua'}});
db.category.updateOne({_id: 2} ,{$set:{name: 'cap'}});

//deleting data from collections
db.admin.deleteOne({_id:1})
db.users.deleteOne({_id:3})
db.category.deleteOne({_id:2})
