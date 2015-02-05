require('bundler/setup')
Bundler.require(:default, :test)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get ('/') do
  @periods = Period.all()
  @students = Student.all()
  erb(:index)
end

post('/periods') do
  name = params[:name]
  @period = Period.create({:name => name})
  @period.save()
  @periods= Period.all()
  erb redirect back
end

post('/students') do
  student_name = params[:name]
  @student = Student.create({:name => student_name})
  @student.save()
  @students = Student.all()
  erb redirect back
end

get('/period/:id') do
  @period = Period.find(params.fetch('id'))
  @students = Student.all()
  erb(:period)
end

post('/period/:id') do
  @period = Period.find(params.fetch('id'))
  @students = Student.all()
  erb(:period)
end

get('/student/:id') do
  @student = Student.find(params.fetch('id'))
  @periods = Period.all()
  @periods_student_has = @periods
  erb(:student)
end

post('/student/:id') do
  @student = Student.find(params.fetch('id'))
  @periods = Period.all()

  redirect back
end
