(* 
 ** Project : strmixed 
 ** Author  : Mark Bellaire
 ** Year    : 2018
 ** License : MIT
*)

#include "./../HATS/project.hats"
#include "share/atspre_staload.hats"

staload "./../SATS/strmixed.sats"

local
assume strmixed(b,l) = @(bool b, ptr l)
in
implement {}
string2mixed( str  )  =
    let
        val [l:addr] (p:ptr l) = g1ofg0(ptrcast(str))
        val () = assertloc(p > 0)
     in  @( false,  p  )
    end 

implement {}
strptr2mixed{l}( str  ) =
      @( true,  $UNSAFE.castvwtp0{ptr l}(str)  ) 

implement {}
strmixed_peek( sm ) = sm.0 


implement {}
strmixed_is_null{b}{l}( sm ) = ~(sm.1 != the_null_ptr)
 
implement {}
strmixed_isnot_null{b}{l}( sm ) = (sm.1 > the_null_ptr) 

implement {}
UN_mixed_borrow( sm )  =
  if sm.1 != the_null_ptr
  then $UNSAFE.cast{ string }(sm.1)
  else ""
 
implement {}
strmixed_copy{b}{l}( sm ) =
  if sm.0 
  then @(sm.0, $UNSAFE.castvwtp0{ptr l}(copy(p)))
    where {
      val p = UN_mixed_borrow(sm)
    }
  else sm 

end

implement {}
strmixed_free(sm) =
  let
    val (pv | s ) = $effmask_all(strmixed_decode(sm))

  in if s.0
     then 
        let
          prval string_is_gc(v) = pv
        in free($effmask_all(strptr_encode( v | s.1 )))
        end
     else {prval string_isnot_gc(v)  = pv 
           prval () = string_v_ignore(v)  }
  end

implement {}
strmixed2string(sm) =  
  let
    val (pv | s ) = strmixed_decode(sm)
    prval string_isnot_gc(v) = pv
   in string_encode( v | s.1)
  end


implement {}
strmixed2strptr(sm) =  
  let
    val (pv | s ) = strmixed_decode(sm)
    prval string_is_gc(v) = pv
   in strptr_encode( v | s.1)
  end

implement {env}
strmixed_foreach$cont( c, env ) = true
implement {env}
strmixed_foreach$fwork( c, env ) = ()

implement {env}
strmixed_foreach(sm,env) =
  string_foreach_env(g1ofg0(UN_mixed_borrow(sm)), env ) where {
    implement 
    string_foreach$fwork<env>( c, env ) = 
        strmixed_foreach$fwork<env>( c, env )
    implement 
    string_foreach$cont<env>( c, env ) = 
        strmixed_foreach$cont<env>( c, env )
  }   







