%% Particle_Sphere class
%
%% Description
%
%% Implementation
%
classdef Particle_Sphere < Particle
    %% Public properties
    properties (SetAccess = public, GetAccess = public)
        
    end
    
    %% Constructor method
    methods
        function this = Particle_Sphere()
            this = this@Particle(Particle.SPHERE);
            this.setDefaultProps();
        end
    end
    
    %% Public methods: implementation of superclass declarations
    methods
        %------------------------------------------------------------------
        function setDefaultProps(this)
            % Forcing terms
            this.force     = [0;0];
            this.torque    = 0;
            this.heat_rate = 0;
            
            % Mechanical state variables
            this.veloc_trl = [0;0];
            this.veloc_rot = 0;
            this.accel_trl = [0;0];
            this.accel_rot = 0;
            
            % Thermal state variables
            this.temperature = 0;
            this.temp_change = 0;
        end
        
        %------------------------------------------------------------------
        function resetForcingTerms(this)
            this.force     = [0;0];
            this.torque    = 0;
            this.heat_rate = 0;
        end
        
        %------------------------------------------------------------------
        function setSurface(this)
            this.surface = 4 * pi * this.radius^2;
        end
        
        %------------------------------------------------------------------
        function setVolume(this)
            this.volume = 4 * pi * this.radius^3/3;
        end
        
        %------------------------------------------------------------------
        function setMInertia(this)
            this.minertia = 2 * this.mass * this.radius^2/5;
        end
    end
end