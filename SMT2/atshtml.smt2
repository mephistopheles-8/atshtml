;;
;; SMT2 Prelude: atshtml
;;
(declare-sort html5_attr_list 0)
(declare-sort html5_elm_list 0)
(declare-sort html5_attr 0)
(declare-sort html5_elm 0)
(define-fun ifint_bool_int_int ((x Bool) (i0 Int) (i1 Int)) Int (ite x i0 i1))
(define-fun lor16 ((i0 Int) (i1 Int)) Int (bv2int (bvor ((_ int2bv 16) i0) ((_ int2bv 16) i1))))
