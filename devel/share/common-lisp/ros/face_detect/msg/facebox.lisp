; Auto-generated. Do not edit!


(cl:in-package face_detect-msg)


;//! \htmlinclude facebox.msg.html

(cl:defclass <facebox> (roslisp-msg-protocol:ros-message)
  ((top
    :reader top
    :initarg :top
    :type cl:fixnum
    :initform 0)
   (left
    :reader left
    :initarg :left
    :type cl:fixnum
    :initform 0)
   (width
    :reader width
    :initarg :width
    :type cl:fixnum
    :initform 0)
   (height
    :reader height
    :initarg :height
    :type cl:fixnum
    :initform 0))
)

(cl:defclass facebox (<facebox>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <facebox>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'facebox)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name face_detect-msg:<facebox> is deprecated: use face_detect-msg:facebox instead.")))

(cl:ensure-generic-function 'top-val :lambda-list '(m))
(cl:defmethod top-val ((m <facebox>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_detect-msg:top-val is deprecated.  Use face_detect-msg:top instead.")
  (top m))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <facebox>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_detect-msg:left-val is deprecated.  Use face_detect-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <facebox>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_detect-msg:width-val is deprecated.  Use face_detect-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <facebox>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_detect-msg:height-val is deprecated.  Use face_detect-msg:height instead.")
  (height m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <facebox>) ostream)
  "Serializes a message object of type '<facebox>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'top)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'top)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <facebox>) istream)
  "Deserializes a message object of type '<facebox>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'top)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'top)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<facebox>)))
  "Returns string type for a message object of type '<facebox>"
  "face_detect/facebox")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'facebox)))
  "Returns string type for a message object of type 'facebox"
  "face_detect/facebox")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<facebox>)))
  "Returns md5sum for a message object of type '<facebox>"
  "84a8772d0473c9a0b5e2268e6352f57e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'facebox)))
  "Returns md5sum for a message object of type 'facebox"
  "84a8772d0473c9a0b5e2268e6352f57e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<facebox>)))
  "Returns full string definition for message of type '<facebox>"
  (cl:format cl:nil "uint16 top~%uint16 left~%uint16 width~%uint16 height~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'facebox)))
  "Returns full string definition for message of type 'facebox"
  (cl:format cl:nil "uint16 top~%uint16 left~%uint16 width~%uint16 height~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <facebox>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <facebox>))
  "Converts a ROS message object to a list"
  (cl:list 'facebox
    (cl:cons ':top (top msg))
    (cl:cons ':left (left msg))
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
))
