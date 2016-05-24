.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;
.super Ljava/lang/Object;
.source "AdobeAuthManager.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->loginInternal(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

.field final synthetic val$interactionMode:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

.field final synthetic val$sendExternal:Z


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;ZLcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    .prologue
    .line 560
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iput-boolean p2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;->val$sendExternal:Z

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;->val$interactionMode:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    .registers 4
    .param p1, "authError"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .prologue
    .line 568
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iget-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;->val$sendExternal:Z

    # invokes: Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->postLoginError(ZLcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    invoke-static {v0, v1, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->access$100(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;ZLcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 569
    return-void
.end method

.method public onInfoNeeded(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;)V
    .registers 4
    .param p1, "info"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    .prologue
    .line 572
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;->val$interactionMode:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;->AdobeAuthInteractionInteractive:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    if-ne v0, v1, :cond_1d

    .line 573
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededUsernameAndPassword:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    if-ne p1, v0, :cond_12

    .line 574
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    sget v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;->AUTH_SESSION_TYPE_SIGN_IN:I

    # invokes: Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->launchSignInActivity(I)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->access$300(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;I)V

    .line 581
    :goto_11
    return-void

    .line 576
    :cond_12
    new-instance v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_INTERACTION_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;->onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    goto :goto_11

    .line 579
    :cond_1d
    new-instance v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_INTERACTION_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;->onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    goto :goto_11
.end method

.method public onSuccess(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "adobeId"    # Ljava/lang/String;
    .param p2, "accessToken"    # Ljava/lang/String;

    .prologue
    .line 563
    const-string v0, "Valid Authentication Token"

    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAuthStep(Ljava/lang/String;Ljava/lang/String;)V

    .line 564
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iget-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;->val$sendExternal:Z

    # invokes: Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->postLoginSuccess(Z)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->access$000(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;Z)V

    .line 565
    return-void
.end method
