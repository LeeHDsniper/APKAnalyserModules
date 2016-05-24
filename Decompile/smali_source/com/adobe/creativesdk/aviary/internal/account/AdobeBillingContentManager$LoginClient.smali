.class Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;
.super Ljava/lang/Object;
.source "AdobeBillingContentManager.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LoginClient"
.end annotation


# instance fields
.field private final options:Landroid/os/Bundle;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Landroid/os/Bundle;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 123
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;->options:Landroid/os/Bundle;

    .line 125
    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    .registers 5
    .param p1, "authError"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .prologue
    .line 162
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_9

    .line 180
    :goto_8
    return-void

    .line 165
    :cond_9
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "Login::onError"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 168
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".adobeId.user.signin"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 170
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "error"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;->getErrorCode()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ordinal()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 171
    const-string v1, "options"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;->options:Landroid/os/Bundle;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 174
    :try_start_46
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$100(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->unregisterLoginClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;)V
    :try_end_4f
    .catch Ljava/lang/NullPointerException; {:try_start_46 .. :try_end_4f} :catch_53

    .line 179
    :goto_4f
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;->printStackTrace()V

    goto :goto_8

    .line 175
    :catch_53
    move-exception v1

    goto :goto_4f
.end method

.method public onSuccess(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;)V
    .registers 7
    .param p1, "userProfile"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    .prologue
    .line 129
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_9

    .line 158
    :goto_8
    return-void

    .line 133
    :cond_9
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "Login::onSuccess: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 145
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".adobeId.user.signin"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 147
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "error"

    sget-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_NO_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ordinal()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 148
    const-string v1, "user"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 149
    const-string v1, "options"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;->options:Landroid/os/Bundle;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 151
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 154
    :try_start_58
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$100(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->unregisterLoginClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;)V
    :try_end_61
    .catch Ljava/lang/NullPointerException; {:try_start_58 .. :try_end_61} :catch_62

    goto :goto_8

    .line 155
    :catch_62
    move-exception v1

    goto :goto_8
.end method
