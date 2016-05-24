.class public Lcom/adobe/creativesdk/aviary/internal/events/MessageReceivedEvent;
.super Ljava/lang/Object;
.source "MessageReceivedEvent.java"


# instance fields
.field public final extra:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "extra"    # Landroid/os/Bundle;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/events/MessageReceivedEvent;->extra:Landroid/os/Bundle;

    .line 13
    return-void
.end method
