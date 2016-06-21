;; Auto-generated. Do not edit!


(when (boundp 'face_detect::facebox)
  (if (not (find-package "FACE_DETECT"))
    (make-package "FACE_DETECT"))
  (shadow 'facebox (find-package "FACE_DETECT")))
(unless (find-package "FACE_DETECT::FACEBOX")
  (make-package "FACE_DETECT::FACEBOX"))

(in-package "ROS")
;;//! \htmlinclude facebox.msg.html


(defclass face_detect::facebox
  :super ros::object
  :slots (_top _left _width _height ))

(defmethod face_detect::facebox
  (:init
   (&key
    ((:top __top) 0)
    ((:left __left) 0)
    ((:width __width) 0)
    ((:height __height) 0)
    )
   (send-super :init)
   (setq _top (round __top))
   (setq _left (round __left))
   (setq _width (round __width))
   (setq _height (round __height))
   self)
  (:top
   (&optional __top)
   (if __top (setq _top __top)) _top)
  (:left
   (&optional __left)
   (if __left (setq _left __left)) _left)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:serialization-length
   ()
   (+
    ;; uint16 _top
    2
    ;; uint16 _left
    2
    ;; uint16 _width
    2
    ;; uint16 _height
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _top
       (write-word _top s)
     ;; uint16 _left
       (write-word _left s)
     ;; uint16 _width
       (write-word _width s)
     ;; uint16 _height
       (write-word _height s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _top
     (setq _top (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _left
     (setq _left (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _width
     (setq _width (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _height
     (setq _height (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get face_detect::facebox :md5sum-) "84a8772d0473c9a0b5e2268e6352f57e")
(setf (get face_detect::facebox :datatype-) "face_detect/facebox")
(setf (get face_detect::facebox :definition-)
      "uint16 top
uint16 left
uint16 width
uint16 height

")



(provide :face_detect/facebox "84a8772d0473c9a0b5e2268e6352f57e")


