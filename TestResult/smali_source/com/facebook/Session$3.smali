.class Lcom/facebook/Session$3;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Lcom/facebook/AuthorizationClient$OnCompletedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/Session;->tryLegacyAuth(Lcom/facebook/Session$AuthorizationRequest;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/Session;


# direct methods
.method constructor <init>(Lcom/facebook/Session;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/Session$3;->this$0:Lcom/facebook/Session;

    .line 1440
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/AuthorizationClient$Result;)V
    .registers 5
    .param p1, "result"    # Lcom/facebook/AuthorizationClient$Result;

    .prologue
    .line 1444
    iget-object v1, p1, Lcom/facebook/AuthorizationClient$Result;->code:Lcom/facebook/AuthorizationClient$Result$Code;

    sget-object v2, Lcom/facebook/AuthorizationClient$Result$Code;->CANCEL:Lcom/facebook/AuthorizationClient$Result$Code;

    if-ne v1, v2, :cond_d

    .line 1445
    const/4 v0, 0x0

    .line 1449
    .local v0, "activityResult":I
    :goto_7
    iget-object v1, p0, Lcom/facebook/Session$3;->this$0:Lcom/facebook/Session;

    # invokes: Lcom/facebook/Session;->handleAuthorizationResult(ILcom/facebook/AuthorizationClient$Result;)V
    invoke-static {v1, v0, p1}, Lcom/facebook/Session;->access$11(Lcom/facebook/Session;ILcom/facebook/AuthorizationClient$Result;)V

    .line 1450
    return-void

    .line 1447
    .end local v0    # "activityResult":I
    :cond_d
    const/4 v0, -0x1

    .restart local v0    # "activityResult":I
    goto :goto_7
.end method
