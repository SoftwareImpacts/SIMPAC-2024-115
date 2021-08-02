%% Particle_Cylinder class
%
%% Description
%
%% Implementation
%
classdef Particle_Cylinder < Particle
    %% Public properties
    properties (SetAccess = public, GetAccess = public)
        % Geometric properties
        radius double = double.empty;   % radius
        len    double = double.empty;   % length
    end
    
    %% Constructor method
    methods
        function this = Particle_Cylinder()
            this = this@Particle(Particle.CYLINDER);
            this.setDefaultProps();
        end
    end
    
    %% Public methods: implementation of superclass declarations
    methods
        %------------------------------------------------------------------
        function setDefaultProps(this)
            % Flags for free/fixed particle
            this.free_trl   = true;
            this.free_rot   = true;
            this.free_therm = true;
            
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
        function setSurface(this)
            this.surface = 2 * pi * this.radius * this.len;
        end
        
        %------------------------------------------------------------------
        function setVolume(this)
            this.volume = pi * this.radius^2 * this.len;
        end
        
        %------------------------------------------------------------------
        function setMInertia(this)
            this.minertia = this.mass * this.radius^2/2;
        end
    end
end