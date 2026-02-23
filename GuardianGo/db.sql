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