(defpackage #:app/models
  (:use #:cl)
  (:import-from #:mito
                #:dao-table-class))
(in-package app/models)


(defclass user ()
  ((email :col-type (or (:varchar 255)
                        :null)
          :initarg :email
          :initform nil
          :reader get-email)
   ;; (username :col-type (or (:varchar 255)
   ;;                         :null)
   ;;           :initarg :username
   ;;           :initform nil
   ;;           :reader get-username)
   )
  (:metaclass dao-table-class))
