require 'spec_helper'

feature 'user deletes a specific task' do
  scenario 'deleting task' do
    FactoryGirl.create(:task, title: 'call plumber')
    FactoryGirl.create_list(:task, 10)
    visit tasks_path
    task_count = Task.count

    expect(page).to have_content('call plumber')
save_and_open_page
    click_on 'Delete'

    expect(page).to_not have_content('call plumber')
    expect(Task.count).to eql(task_count - 1)
  end
end
