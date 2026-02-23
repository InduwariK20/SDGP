CREATE TABLE public.Attendance (
  recorded_at timestamp without time zone NOT NULL DEFAULT now(),
  attendance_id uuid NOT NULL UNIQUE,
  student_id uuid NOT NULL UNIQUE,
  bus_id uuid NOT NULL UNIQUE,
  status text NOT NULL,
  CONSTRAINT Attendance_pkey PRIMARY KEY (attendance_id),
  CONSTRAINT Attendance_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.Student(student_id),
  CONSTRAINT Attendance_bus_id_fkey FOREIGN KEY (bus_id) REFERENCES public.Bus(bus_id)
);

CREATE TABLE public.Bus (
  bus_id uuid NOT NULL UNIQUE,
  bus_number text NOT NULL UNIQUE,
  driver_id uuid NOT NULL UNIQUE,
  route_name text NOT NULL,
  capacity bigint NOT NULL,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT Bus_pkey PRIMARY KEY (bus_id),
  CONSTRAINT Bus_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.Profile(profile_id)
);

CREATE TABLE public.Bus_Location (
  recorded_at timestamp without time zone NOT NULL,
  bus_location_id uuid NOT NULL UNIQUE,
  bus_id uuid NOT NULL UNIQUE,
  latitude numeric NOT NULL,
  longitude numeric NOT NULL,
  speed numeric NOT NULL,
  CONSTRAINT Bus_Location_pkey PRIMARY KEY (bus_location_id),
  CONSTRAINT Bus_Location_bus_id_fkey FOREIGN KEY (bus_id) REFERENCES public.Bus(bus_id)
);

CREATE TABLE public.Message (
  message_id uuid NOT NULL UNIQUE,
  sender_id uuid NOT NULL UNIQUE,
  received_id uuid NOT NULL UNIQUE,
  message text NOT NULL,
  send_at timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT Message_pkey PRIMARY KEY (message_id),
  CONSTRAINT Message_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.Profile(profile_id),
  CONSTRAINT Message_received_id_fkey FOREIGN KEY (received_id) REFERENCES public.Profile(profile_id)
);

CREATE TABLE public.Payment (
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  payment_id uuid NOT NULL UNIQUE,
  student_id uuid NOT NULL UNIQUE,
  parent_id uuid NOT NULL UNIQUE,
  amount numeric NOT NULL,
  payment_status text NOT NULL,
  payment_date timestamp without time zone NOT NULL,
  CONSTRAINT Payment_pkey PRIMARY KEY (payment_id),
  CONSTRAINT Payment_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.Student(student_id),
  CONSTRAINT Payment_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.Profile(profile_id)
);
