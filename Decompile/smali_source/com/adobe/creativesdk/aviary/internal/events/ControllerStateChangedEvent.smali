.class public Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;
.super Ljava/lang/Object;
.source "ControllerStateChangedEvent.java"


# instance fields
.field public final newState:I

.field public final oldState:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "newState"    # I
    .param p2, "previousState"    # I

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput p1, p0, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;->newState:I

    .line 13
    iput p2, p0, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;->oldState:I

    .line 14
    return-void
.end method
