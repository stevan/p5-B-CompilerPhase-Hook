#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = B::CompilerPhase::Hook  PACKAGE = B::CompilerPhase::Hook

PROTOTYPES: ENABLE

void
enqueue_UNITCHECK(handler)
        SV* handler
    PROTOTYPE: &
    CODE:
        if ( !PL_unitcheckav ) {
            PL_unitcheckav = newAV();
        }
        SvREFCNT_inc(handler);
        av_unshift(PL_unitcheckav, 1);
        av_store(PL_unitcheckav, 0, handler);

void
enqueue_CHECK(handler)
        SV* handler
    PROTOTYPE: &        
    CODE:
        if ( !PL_checkav ) {
            PL_checkav = newAV();
        }
        SvREFCNT_inc(handler);
        av_unshift(PL_checkav, 1);
        av_store(PL_checkav, 0, handler);

void
enqueue_INIT(handler)
        SV* handler
    PROTOTYPE: &
    CODE:
        if ( !PL_initav ) {
            PL_initav = newAV();
        }
        SvREFCNT_inc(handler);
        av_push(PL_initav, handler);

void
enqueue_BEGIN(handler)
        SV* handler
    PROTOTYPE: &
    CODE:
        if ( !PL_beginav ) {
            PL_beginav = newAV();
        }
        SvREFCNT_inc(handler);
        av_push(PL_beginav, handler);

void
enqueue_END(handler)
        SV* handler
    PROTOTYPE: &
    CODE:
        if ( !PL_endav ) {
            PL_endav = newAV();
        }
        SvREFCNT_inc(handler);
        av_unshift(PL_endav, 1);
        av_store(PL_endav, 0, handler);



