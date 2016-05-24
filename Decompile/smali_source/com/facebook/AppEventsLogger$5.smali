.class Lcom/facebook/AppEventsLogger$5;
.super Ljava/lang/Object;
.source "AppEventsLogger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/AppEventsLogger;->logEvent(Landroid/content/Context;Lcom/facebook/AppEventsLogger$AppEvent;Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$accessTokenAppId:Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;

.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$event:Lcom/facebook/AppEventsLogger$AppEvent;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Lcom/facebook/AppEventsLogger$AppEvent;)V
    .registers 4

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/AppEventsLogger$5;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/facebook/AppEventsLogger$5;->val$accessTokenAppId:Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;

    iput-object p3, p0, Lcom/facebook/AppEventsLogger$5;->val$event:Lcom/facebook/AppEventsLogger$AppEvent;

    .line 705
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 708
    iget-object v1, p0, Lcom/facebook/AppEventsLogger$5;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/facebook/AppEventsLogger$5;->val$accessTokenAppId:Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;

    # invokes: Lcom/facebook/AppEventsLogger;->getSessionEventsState(Landroid/content/Context;Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;)Lcom/facebook/AppEventsLogger$SessionEventsState;
    invoke-static {v1, v2}, Lcom/facebook/AppEventsLogger;->access$8(Landroid/content/Context;Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;)Lcom/facebook/AppEventsLogger$SessionEventsState;

    move-result-object v0

    .line 709
    .local v0, "state":Lcom/facebook/AppEventsLogger$SessionEventsState;
    iget-object v1, p0, Lcom/facebook/AppEventsLogger$5;->val$event:Lcom/facebook/AppEventsLogger$AppEvent;

    invoke-virtual {v0, v1}, Lcom/facebook/AppEventsLogger$SessionEventsState;->addEvent(Lcom/facebook/AppEventsLogger$AppEvent;)V

    .line 710
    # invokes: Lcom/facebook/AppEventsLogger;->flushIfNecessary()V
    invoke-static {}, Lcom/facebook/AppEventsLogger;->access$9()V

    .line 711
    return-void
.end method
