;; Auto-generated. Do not edit!


(when (boundp 'face_detect::faces)
  (if (not (find-package "FACE_DETECT"))
    (make-package "FACE_DETECT"))
  (shadow 'faces (find-package "FACE_DETECT")))
(unless (find-package "FACE_DETECT::FACES")
  (make-package "FACE_DETECT::FACES"))

(in-package "ROS")
;;//! \htmlinclude faces.msg.html


(defclass face_detect::faces
  :super ros::object
  :slots (_face_boxes _image_width _image_height ))

(defmethod face_detect::faces
  (:init
   (&key
    ((:face_boxes __face_boxes) (let (r) (dotimes (i 0) (push (instance face_detect::facebox :init) r)) r))
    ((:image_width __image_width) 0)
    ((:image_height __image_height) 0)
    )
   (send-super :init)
   (setq _face_boxes __face_boxes)
   (setq _image_width (round __image_width))
   (setq _image_height (round __image_height))
   self)
  (:face_boxes
   (&rest __face_boxes)
   (if (keywordp (car __face_boxes))
       (send* _face_boxes __face_boxes)
     (progn
       (if __face_boxes (setq _face_boxes (car __face_boxes)))
       _face_boxes)))
  (:image_width
   (&optional __image_width)
   (if __image_width (setq _image_width __image_width)) _image_width)
  (:image_height
   (&optional __image_height)
   (if __image_height (setq _image_height __image_height)) _image_height)
  (:serialization-length
   ()
   (+
    ;; face_detect/facebox[] _face_boxes
    (apply #'+ (send-all _face_boxes :serialization-length)) 4
    ;; uint16 _image_width
    2
    ;; uint16 _image_height
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; face_detect/facebox[] _face_boxes
     (write-long (length _face_boxes) s)
     (dolist (elem _face_boxes)
       (send elem :serialize s)
       )
     ;; uint16 _image_width
       (write-word _image_width s)
     ;; uint16 _image_height
       (write-word _image_height s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; face_detect/facebox[] _face_boxes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _face_boxes (let (r) (dotimes (i n) (push (instance face_detect::facebox :init) r)) r))
     (dolist (elem- _face_boxes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; uint16 _image_width
     (setq _image_width (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _image_height
     (setq _image_height (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get face_detect::faces :md5sum-) "0a7567e15b2cf367464a82218fea65a8")
(setf (get face_detect::faces :datatype-) "face_detect/faces")
(setf (get face_detect::faces :definition-)
      "facebox[] face_boxes
uint16 image_width
uint16 image_height

================================================================================
MSG: face_detect/facebox
uint16 top
uint16 left
uint16 width
uint16 height

")



(provide :face_detect/faces "0a7567e15b2cf367464a82218fea65a8")


