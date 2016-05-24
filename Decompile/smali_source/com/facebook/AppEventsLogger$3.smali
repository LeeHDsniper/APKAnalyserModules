.class Lcom/facebook/AppEventsLogger$3;
.super Ljava/lang/Object;
.source "AppEventsLogger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/AppEventsLogger;->initializeTimersIfNeeded()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 658
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 661
    invoke-static {}, Lcom/facebook/AppEventsLogger;->getFlushBehavior()Lcom/facebook/AppEventsLogger$FlushBehavior;

    move-result-object v0

    sget-object v1, Lcom/facebook/AppEventsLogger$FlushBehavior;->EXPLICIT_ONLY:Lcom/facebook/AppEventsLogger$FlushBehavior;

    if-eq v0, v1, :cond_d

    .line 662
    sget-object v0, Lcom/facebook/AppEventsLogger$FlushReason;->TIMER:Lcom/facebook/AppEventsLogger$FlushReason;

    # invokes: Lcom/facebook/AppEventsLogger;->flushAndWait(Lcom/facebook/AppEventsLogger$FlushReason;)V
    invoke-static {v0}, Lcom/facebook/AppEventsLogger;->access$5(Lcom/facebook/AppEventsLogger$FlushReason;)V

    .line 664
    :cond_d
    return-void
.end method
