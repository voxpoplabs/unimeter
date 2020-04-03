class Ability
    include CanCan::Ability

    def initialize(user)

        # All users can access public meters
        can [:show, :data, :about, :news, :rules, :updates, :analytics], Meter, meter_type: "public"
        can [:show], Promise, meter: { meter_type: "public" }
        can [:index], Log, promise: {meter: { meter_type: "public" } }
        can [:new, :create], User

        return unless user.present?

        # Logged in users have access to their own meters
        can [:edit, :update], User, id: user.id
        can [:new, :create, :edit, :update, :destroy, :dashboard, :overview, :assign_user], Meter, user_id: user.id
        can [:new, :create, :edit, :update, :destroy], Promise, meter: { user_id: user.id }
        can [:new, :create, :edit, :update, :destroy], Article, promise: { meter: { user_id: user.id } }
        can [:new, :create, :edit, :update, :destroy], Log, promise: { meter: { user_id: user.id } }
        can [:new, :create, :edit, :update, :destroy], Blogpost, meter: { user_id: user.id }
        can [:index, :destroy], Subscription, user_id: user.id

        # Users with access to a polimeter premium meter
        user.roles.where(resource_type: "Meter").each { |role| send(role.name.to_sym, role.resource_id) }

    end

    # Polimeter Premium Meter Roles
    def meter_admin(*meter_id)
        puts "User is Admin for meter id " + meter_id[0].to_s
        meter_id = meter_id[0]
        meter_editor(meter_id) #inherit editor abilities
        meter_viewer(meter_id) #inherit viewer abilities
        can [:new, :create, :edit, :update, :destroy, :dashboard, :overview, :assign_user], Meter, id: meter_id
        can [:new, :create, :edit, :update, :destroy], Blogpost, meter: { id: meter_id}

    end

    def meter_editor(*meter_id)
        puts "User is Editor for meter id" + meter_id[0].to_s
        meter_id = meter_id[0]
        meter_viewer(meter_id) #inherit viewer abilities
        puts meter_id
        can [:new, :create, :edit, :update, :destroy], Promise, meter: { id: meter_id }
        can [:new, :create, :edit, :update, :destroy], Article, promise: { meter: { id: meter_id } }
        can [:new, :create, :edit, :update, :destroy], Log, promise: { meter: { id: meter_id } }
    end

    def meter_viewer(*meter_id)
        puts "User is Viewer for meter id" + meter_id[0].to_s
        meter_id = meter_id[0]
        can [:show, :about, :rules, :updates, :analytics], Meter, id: meter_id
        can [:show], Promise, meter: { id: meter_id }
    end

end

#Global Roles
#Polimeter_premium :polimeter_premium


#Resource Speicific Roles

#Meter Admin - meter_admin - Can do everthing
#Meter Member - meter_member - Can add articles and promises to a meter.
#Meter Read - meter_viewer - Can only read
