
(cl:in-package :asdf)

(defsystem "face_detect-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "facebox" :depends-on ("_package_facebox"))
    (:file "_package_facebox" :depends-on ("_package"))
    (:file "faces" :depends-on ("_package_faces"))
    (:file "_package_faces" :depends-on ("_package"))
  ))