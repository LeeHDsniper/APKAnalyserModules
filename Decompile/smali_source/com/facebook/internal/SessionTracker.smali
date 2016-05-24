.class public Lcom/facebook/internal/SessionTracker;
.super Ljava/lang/Object;
.source "SessionTracker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/internal/SessionTracker$ActiveSessionBroadcastReceiver;
    }
.end annotation


# instance fields
.field private final callback:Lcom/facebook/Session$StatusCallback;


# direct methods
.method static synthetic access$0(Lcom/facebook/internal/SessionTracker;)Lcom/facebook/Session$StatusCallback;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/facebook/internal/SessionTracker;->callback:Lcom/facebook/Session$StatusCallback;

    return-object v0
.end method
