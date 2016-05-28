.class Lcom/facebook/Session$AuthorizationRequest$3;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Lcom/facebook/Session$StartActivityDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/Session$AuthorizationRequest;-><init>(Lcom/facebook/SessionLoginBehavior;ILjava/util/List;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/facebook/Session$AuthorizationRequest;


# direct methods
.method constructor <init>(Lcom/facebook/Session$AuthorizationRequest;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/Session$AuthorizationRequest$3;->this$1:Lcom/facebook/Session$AuthorizationRequest;

    .line 1932
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getActivityContext()Landroid/app/Activity;
    .registers 3

    .prologue
    .line 1941
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 1942
    const-string v1, "Cannot create an AuthorizationRequest without a valid Activity or Fragment"

    .line 1941
    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I

    .prologue
    .line 1935
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 1936
    const-string v1, "Cannot create an AuthorizationRequest without a valid Activity or Fragment"

    .line 1935
    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
