.class abstract Lcom/facebook/AuthorizationClient$AuthHandler;
.super Ljava/lang/Object;
.source "AuthorizationClient.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/AuthorizationClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "AuthHandler"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field methodLoggingExtras:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/facebook/AuthorizationClient;


# direct methods
.method constructor <init>(Lcom/facebook/AuthorizationClient;)V
    .registers 2

    .prologue
    .line 530
    iput-object p1, p0, Lcom/facebook/AuthorizationClient$AuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected addLoggingExtra(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 554
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthHandler;->methodLoggingExtras:Ljava/util/Map;

    if-nez v0, :cond_b

    .line 555
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/AuthorizationClient$AuthHandler;->methodLoggingExtras:Ljava/util/Map;

    .line 557
    :cond_b
    iget-object v1, p0, Lcom/facebook/AuthorizationClient$AuthHandler;->methodLoggingExtras:Ljava/util/Map;

    if-nez p2, :cond_14

    const/4 v0, 0x0

    :goto_10
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    return-void

    .line 557
    :cond_14
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_10
.end method

.method cancel()V
    .registers 1

    .prologue
    .line 551
    return-void
.end method

.method abstract getNameForLogging()Ljava/lang/String;
.end method

.method needsInternetPermission()Z
    .registers 2

    .prologue
    .line 547
    const/4 v0, 0x0

    return v0
.end method

.method needsRestart()Z
    .registers 2

    .prologue
    .line 543
    const/4 v0, 0x0

    return v0
.end method

.method onActivityResult(IILandroid/content/Intent;)Z
    .registers 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 539
    const/4 v0, 0x0

    return v0
.end method

.method abstract tryAuthorize(Lcom/facebook/AuthorizationClient$AuthorizationRequest;)Z
.end method
