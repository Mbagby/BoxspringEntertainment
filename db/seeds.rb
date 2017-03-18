
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
p "creating active admin user ----->"
admin = AdminUser.find_by(email:"admin@madeline.com")
AdminUser.create!(email:"admin@madeline.com", password:"admin123", password_confirmation:"admin123") unless admin.present?
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

p "creating testing user ----->"
tester = User.find_by(email:'atnika@gmail.com')
User.create!(email:'atnika@gmail.com', password:'tester123', password_confirmation:'tester123') unless tester.present?

Category.destroy_all
p "creating Category data ----->"
categoryOne = Category.create({
    category_id: '001',
		title: 'Ethics & Compliance',
		description: 'Ethics and Compliance',
		snap_shot: 'EthicsAndCompliance',
	}
)
categoryTwo = Category.create({
		category_id: '004',
		title: 'Consciousness',
		description: 'Consciousness',
		snap_shot: 'Consciousness',
	}
)
categoryThree = Category.create({
		category_id: '003',
    title: 'Technology',
    description: 'Computer security, also known as cybersecurity or IT security, is the protection of information systems from theft or damage to the hardware, the software, and to the information on them, as well as from disruption or misdirection of the services they provide.',
    snap_shot: 'Technology',
  }
)
categoryFour = Category.create({
		category_id: '002',
    title: 'Communication',
    description: 'Computer security, also known as cybersecurity or IT security, is the protection of information systems from theft or damage to the hardware, the software, and to the information on them, as well as from disruption or misdirection of the services they provide.',
    snap_shot: 'Communication',
  }
)

p "creating Topics data ----->"
topics = [
  {
    category_id:categoryOne.id,
    title:'The HR Files',
    description:'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
    icon: 'TheHRFiles'
  },
  {
    category_id:categoryTwo.id,
    title:'Sea Knot',
    description:'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
    icon: 'SeaKnot'
  },
  {
    category_id:categoryThree.id,
    title:'Hacks',
    description:'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
    icon: 'Hacks'
  },
  {
    category_id:categoryFour.id,
    title:'Communication',
    description:'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
    icon: 'Communication'
  }
]
topics.map{|season| Topic.create(season)}

p "creating Season data ----->"
seasons = [
	{
    series_id:'1',
    topic_id: Topic.all[0].id,
     category_id:categoryOne.id,
     title:'The HR Files',
     description:'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
     rating: '5',
     snap_shot: 'TheHRFiles'
	},
		{series_id:'2',
      topic_id: Topic.all[1].id,
     category_id:categoryTwo.id,
     title:'Sea Knot',
     description:'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
     rating: '4',
     snap_shot: 'SeaKnot'
	},
		{series_id:'3',
      topic_id: Topic.all[2].id,
     category_id:categoryThree.id,
     title:'Hacks',
     description:'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
     rating: '5',
     snap_shot: 'Hacks'
	},
  {
    series_id:'4',
    topic_id: Topic.all[2].id,
    category_id:categoryFour.id,
    title:'Hacks',
    description:'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
    rating: '5',
    snap_shot: 'Communication_Season'
 }
]
seasons.map{|ss| Season.create(ss)}


p "creating Episode data ----->"
episodes = Episode.create([
  {
    episode_id: '1',
    series_id:'1',
    category_id: categoryOne.id,
    topic_id:Topic.all[0].id,
    season_id:Season.all[0].id,
    title:'Cost Of Onboarding',
    description: 'Episode 1',
    rating: '4',
    snap_shot:'CostOfOnboarding'
  },
  {
    episode_id: '2',
    series_id:'1',
    category_id: categoryOne.id,
    topic_id:Topic.all[0].id,
    season_id:Season.all[0].id,
    title:'Equal Opportunity Employer',
    description: 'Episode 2',
    rating: '4',
    snap_shot:'EqualOpportunityEmployer'
  },
  {
    episode_id: '3',
    series_id:'1',
    category_id: categoryOne.id,
    topic_id:Topic.all[0].id,
    season_id:Season.all[0].id,
    title:'Vetting Employees',
    description: 'Episode 3',
    rating: '5',
    snap_shot:'VettingEmployees'
  },
  {
    episode_id: '4',
    series_id:'1',
    category_id: categoryOne.id,
    topic_id:Topic.all[0].id,
    season_id:Season.all[0].id,
    title:'Business Bar Brawls',
    description: 'Episode 4',
    rating: '4',
    snap_shot:'BusinessBarBrawls'
  },
  {
    episode_id: '5',
    series_id:'3',
    category_id:categoryThree.id,
    topic_id:Topic.all[2].id,
    season_id:Season.all[2].id,
    title:'Secure Passwords',
    description: 'Episode 1',
    rating: '3',
    snap_shot:'SecurePasswords'
  },
  {
    episode_id: '6',
    series_id:'3',
    category_id:categoryThree.id,
    topic_id:Topic.all[2].id,
    season_id:Season.all[2].id,
    title:'Phishing',
    description: 'Episode 2',
    rating: '4',
    snap_shot:'Phishing'
  },
  {
    episode_id: '7',
    series_id:'3',
    category_id:categoryThree.id,
    topic_id:Topic.all[2].id,
    season_id:Season.all[2].id,
    title:'Securing Your Computer',
    description: 'Episode 3',
    rating: '4',
    snap_shot:'SecuringYourComputer'
  },
  {
    episode_id: '8',
    series_id:'3',
    category_id:categoryThree.id,
    topic_id:Topic.all[2].id,
    season_id:Season.all[2].id,
    title:'Identify Your ID',
    description: 'Episode 4',
    rating: '5',
    snap_shot:'IdentifyYourID'
  },
  {
    episode_id: '9',
    series_id:'2',
    category_id:categoryTwo.id,
    topic_id:Topic.all[1].id,
    season_id:Season.all[1].id,
    title:'Unconscious Incompetence',
    description: 'Episode 1',
    rating: '3',
    snap_shot:'UnconsciousIncompetence'
  },
  {
    episode_id: '10',
    series_id:'2',
    category_id:categoryTwo.id,
    topic_id:Topic.all[1].id,
    season_id:Season.all[1].id,
    title:'Conscious Incompetence',
    description: 'Episode 2',
    rating: '4',
    snap_shot:'ConsciousIncompetence'
  },
  {
    episode_id: '11',
    series_id:'2',
    category_id:categoryTwo.id,
    topic_id:Topic.all[1].id,
    season_id:Season.all[1].id,
    title:'Conscious Competence',
    description: 'Episode 3',
    rating: '4',
    snap_shot:'ConsciousCompetence'
  },
  {
    episode_id: '12',
    series_id:'2',
    category_id:categoryTwo.id,
    topic_id:Topic.all[1].id,
    season_id:Season.all[1].id,
    title:'Invisible Matter',
    description: 'Episode 4',
    rating: '5',
    snap_shot:'InvisibleMatter'
  },
  {
    episode_id: '13',
    series_id:'4',
    category_id:categoryFour.id,
    topic_id:Topic.all[3].id,
    season_id:Season.all[3].id,
    title:'Conscious Incompetence',
    description: 'Episode 2',
    rating: '5',
    snap_shot:'CQ_Episode_1'
  },
  {
    episode_id: '14',
    series_id:'4',
    category_id:categoryFour.id,
    topic_id:Topic.all[3].id,
    season_id:Season.all[3].id,
    title:'Conscious Competence',
    description: 'Episode 3',
    rating: '4',
    snap_shot:'CQ_Episode_2'
  },
  {
    episode_id: '15',
    series_id:'4',
    category_id:categoryFour.id,
    topic_id:Topic.all[3].id,
    season_id:Season.all[3].id,
    title:'Invisible Matter',
    description: 'Episode 4',
    rating: '5',
    snap_shot:'CQ_Episode_3'
  },
  {
    episode_id: '16',
    series_id:'4',
    category_id:categoryFour.id,
    topic_id:Topic.all[3].id,
    season_id:Season.all[3].id,
    title:'Invisible Matter',
    description: 'Episode 4',
    rating: '5',
    snap_shot:'CQ_Episode_4'
  }

])
