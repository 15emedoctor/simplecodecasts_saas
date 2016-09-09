class  ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            flash[:success] = "Bravo!"
            redirect_to new_contacts_path
        else
               flash[:danger] = "Y a un bug !"
            redirect_to new_contacts_path
        end
            
    end
    
    private
        def contact_params
        params.require(:contact).permit(:name, :email, :comments)
        end
        
end