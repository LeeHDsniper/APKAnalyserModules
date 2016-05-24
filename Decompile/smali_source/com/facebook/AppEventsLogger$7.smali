.class Lcom/facebook/AppEventsLogger$7;
.super Ljava/lang/Object;
.source "AppEventsLogger.java"

# interfaces
.implements Lcom/facebook/Request$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/AppEventsLogger;->buildRequestForSession(Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Lcom/facebook/AppEventsLogger$SessionEventsState;ZLcom/facebook/AppEventsLogger$FlushStatistics;)Lcom/facebook/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$accessTokenAppId:Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;

.field private final synthetic val$flushState:Lcom/facebook/AppEventsLogger$FlushStatistics;

.field private final synthetic val$postRequest:Lcom/facebook/Request;

.field private final synthetic val$sessionEventsState:Lcom/facebook/AppEventsLogger$SessionEventsState;


# direct methods
.method constructor <init>(Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Lcom/facebook/Request;Lcom/facebook/AppEventsLogger$SessionEventsState;Lcom/facebook/AppEventsLogger$FlushStatistics;)V
    .registers 5

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/AppEventsLogger$7;->val$accessTokenAppId:Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;

    iput-object p2, p0, Lcom/facebook/AppEventsLogger$7;->val$postRequest:Lcom/facebook/Request;

    iput-object p3, p0, Lcom/facebook/AppEventsLogger$7;->val$sessionEventsState:Lcom/facebook/AppEventsLogger$SessionEventsState;

    iput-object p4, p0, Lcom/facebook/AppEventsLogger$7;->val$flushState:Lcom/facebook/AppEventsLogger$FlushStatistics;

    .line 882
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/Response;)V
    .registers 6
    .param p1, "response"    # Lcom/facebook/Response;

    .prologue
    .line 885
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$7;->val$accessTokenAppId:Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;

    iget-object v1, p0, Lcom/facebook/AppEventsLogger$7;->val$postRequest:Lcom/facebook/Request;

    iget-object v2, p0, Lcom/facebook/AppEventsLogger$7;->val$sessionEventsState:Lcom/facebook/AppEventsLogger$SessionEventsState;

    iget-object v3, p0, Lcom/facebook/AppEventsLogger$7;->val$flushState:Lcom/facebook/AppEventsLogger$FlushStatistics;

    # invokes: Lcom/facebook/AppEventsLogger;->handleResponse(Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Lcom/facebook/Request;Lcom/facebook/Response;Lcom/facebook/AppEventsLogger$SessionEventsState;Lcom/facebook/AppEventsLogger$FlushStatistics;)V
    invoke-static {v0, v1, p1, v2, v3}, Lcom/facebook/AppEventsLogger;->access$10(Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Lcom/facebook/Request;Lcom/facebook/Response;Lcom/facebook/AppEventsLogger$SessionEventsState;Lcom/facebook/AppEventsLogger$FlushStatistics;)V

    .line 886
    return-void
.end method
