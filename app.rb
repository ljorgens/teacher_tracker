require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get ('/') do
  @periods = Period.all()
  @students = Student.all()
  @student_range = Student.all().between(@first_date, @second_date)
  erb(:index)
end

post('/periods') do
  name = params[:name]
  @period = Period.create({:name => name})
  @periods= Period.all()
  @students = Student.all()
  @student_range = Student.all().between(@first_date, @second_date)
  erb(:index)
end

post('/students') do
  student_name = params[:name]
  birthday = params.fetch("birthday")
  @student = Student.create({:name => student_name, :birthday => birthday})
  @students = Student.all()
  @periods = Period.all()
  @student_range = Student.all().between(@first_date, @second_date)
  erb(:index)
end

post('/date_range') do
  @periods = Period.all()
  @students = Student.all()
  @first_date = params.fetch("begin_date")
  @second_date = params.fetch("end_date")
  @student_range = Student.all().between(@first_date, @second_date)
  erb(:index)
end

patch('/student/:id/edit') do
  new_name = params.fetch("new_name")
  @student = Student.find(params.fetch("id").to_i())
  @student.update({:name => new_name})
  erb redirect back
end

patch('/period/:id/edit') do
  new_period = params.fetch("new_period")
  @period = Period.find(params.fetch('id').to_i())
  @period.update({:name => new_period})
  erb redirect back
end

get('/period/:id') do
  @period = Period.find(params.fetch('id'))
  @students = Student.all()
  erb(:period)
end

get('/student/:id') do
  @student = Student.find(params.fetch('id'))
  @periods = Period.all()
  erb(:student)
end

post('/period/:id') do
  @period = Period.find(params.fetch('id'))
  @students = Student.all()
  new_student= params.fetch("student")
  @period.students << Student.find(new_student)
  erb(:period)
end

post('/student/:id') do
  @student = Student.find(params.fetch('id'))
  @periods = Period.all()
  new_period = params.fetch("period")
  @student.periods << Period.find(new_period)

  redirect back
end

post("/student/:id") do
  name = params.fetch("new_name")
  birthday= params.fetch("birthday")
  Period.update({:name => name})
  @students = Student.all
  @periods = Period.all
  redirect back
end

delete('/period/:id') do
  @period = Period.find(params.fetch('id'))
  @period.destroy()
  @student = Student.all()
  @period = Period.all()
  redirect '/'
end

delete('/student/:id') do
  @student = Student.find(params.fetch('id'))
  @student.destroy()
  @period = Period.all()
  @student= Student.all()
  redirect '/'
end

delete('/period/:id/delete') do
@period = Period.find(params.fetch('id'))
@students = Student.all()
new_student = params.fetch("student")
@period.students.delete(new_student)
  redirect back
end

delete('/student/:id/delete') do
@student = Student.find(params.fetch('id'))
@periods = Period.all()
new_period = params.fetch("period")
@student.periods.delete(new_period)
  redirect back
end
