; Auto-generated. Do not edit!


(cl:in-package face_detect-msg)


;//! \htmlinclude faces.msg.html

(cl:defclass <faces> (roslisp-msg-protocol:ros-message)
  ((face_boxes
    :reader face_boxes
    :initarg :face_boxes
    :type (cl:vector face_detect-msg:facebox)
   :initform (cl:make-array 0 :element-type 'face_detect-msg:facebox :initial-element (cl:make-instance 'face_detect-msg:facebox)))
   (image_width
    :reader image_width
    :initarg :image_width
    :type cl:fixnum
    :initform 0)
   (image_height
    :reader image_height
    :initarg :image_height
    :type cl:fixnum
    :initform 0))
)

(cl:defclass faces (<faces>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <faces>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'faces)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name face_detect-msg:<faces> is deprecated: use face_detect-msg:faces instead.")))

(cl:ensure-generic-function 'face_boxes-val :lambda-list '(m))
(cl:defmethod face_boxes-val ((m <faces>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_detect-msg:face_boxes-val is deprecated.  Use face_detect-msg:face_boxes instead.")
  (face_boxes m))

(cl:ensure-generic-function 'image_width-val :lambda-list '(m))
(cl:defmethod image_width-val ((m <faces>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_detect-msg:image_width-val is deprecated.  Use face_detect-msg:image_width instead.")
  (image_width m))

(cl:ensure-generic-function 'image_height-val :lambda-list '(m))
(cl:defmethod image_height-val ((m <faces>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_detect-msg:image_height-val is deprecated.  Use face_detect-msg:image_height instead.")
  (image_height m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <faces>) ostream)
  "Serializes a message object of type '<faces>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'face_boxes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'face_boxes))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'image_width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'image_width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'image_height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'image_height)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <faces>) istream)
  "Deserializes a message object of type '<faces>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'face_boxes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'face_boxes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'face_detect-msg:facebox))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'image_width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'image_width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'image_height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'image_height)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<faces>)))
  "Returns string type for a message object of type '<faces>"
  "face_detect/faces")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'faces)))
  "Returns string type for a message object of type 'faces"
  "face_detect/faces")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<faces>)))
  "Returns md5sum for a message object of type '<faces>"
  "0a7567e15b2cf367464a82218fea65a8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'faces)))
  "Returns md5sum for a message object of type 'faces"
  "0a7567e15b2cf367464a82218fea65a8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<faces>)))
  "Returns full string definition for message of type '<faces>"
  (cl:format cl:nil "facebox[] face_boxes~%uint16 image_width~%uint16 image_height~%~%================================================================================~%MSG: face_detect/facebox~%uint16 top~%uint16 left~%uint16 width~%uint16 height~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'faces)))
  "Returns full string definition for message of type 'faces"
  (cl:format cl:nil "facebox[] face_boxes~%uint16 image_width~%uint16 image_height~%~%================================================================================~%MSG: face_detect/facebox~%uint16 top~%uint16 left~%uint16 width~%uint16 height~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <faces>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'face_boxes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <faces>))
  "Converts a ROS message object to a list"
  (cl:list 'faces
    (cl:cons ':face_boxes (face_boxes msg))
    (cl:cons ':image_width (image_width msg))
    (cl:cons ':image_height (image_height msg))
))
