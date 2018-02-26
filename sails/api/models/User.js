// User.js

var bcrypt = require('bcryptjs');

module.exports = {
	
	attributes: {
		
		email: {
			field: 'email',
			type: Sequelize.STRING,
			unique: true,
			allowNull: false,
			validate: {
			   isEmail: true
			}
		},
		
		password: {
			field: 'password',
			type: Sequelize.STRING,
			allowNull: false,
			validate: {
			   len: [10,255]
			}
		},
		
		role: {
			field: 'role',
			type: Sequelize.STRING,
			allowNull: false,
			defaultValue: 'registered',
			validate: {
				isIn: [[ 'registered', 'admin', 'superadmin' ]]
			}
		},
		
		name: {
			field: 'name',
			type: Sequelize.STRING,
			allowNull: false
		}	
	},
	
	associations: function () { },
	
	options: {
		freezeTableName: true,
		tableName: 'user',
		underscored: true,
		timestamps: false,
		classMethods: {
			
			hashPassword: function (user, options, done) {
				
				// we don't want to double hash the pwd
				if (!user.changed('password')) return done(null, user);
				
				bcrypt.hash(user.password, 10).then(hash => {
					
					user.password = hash;
					return done(null, user);
					
				}).catch(err => done(err));
			},
			
			comparePassword: function (user, password, done) {
				
				bcrypt.compare(password, user.password, (err, success) => {
					
					if (!success) return done(null, false, { message: 'Invalid Password' });
					
					return done(null, user, { message: 'Logged In Successfully' });
					
				});
			}
			
		},
		instanceMethods: {
			
			isSuperAdmin: function () {
				return (this.role == 'superadmin');
			},
			
			isAdmin: function () {
				return (this.role == 'admin' || this.isSuperAdmin());
			},
			
			toJSON: function () {
				var values = Object.assign({}, this.get());
				delete values.password;
				return values;
			}
			
		},
		hooks: {
			
			// beforeBulkCreate: if using bulkCreate pass { individualHooks: true } option to call beforeCreate for each user
			
			beforeCreate: function (user, options, done) {
				return User.hashPassword(user, options, done);
			},
			
			beforeUpdate: function (user, options, done) {
				return User.hashPassword(user, options, done);
			},
			
			beforeUpsert: function (user, options, done) {
				return User.hashPassword(user, options, done);
			},
			
			beforeSave: function (user, options, done) {
				return User.hashPassword(user, options, done);
			}
			
		}
	}
};
