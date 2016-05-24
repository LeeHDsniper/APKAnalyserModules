.class Lcom/facebook/AuthorizationClient$WebViewAuthHandler;
.super Lcom/facebook/AuthorizationClient$AuthHandler;
.source "AuthorizationClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/AuthorizationClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WebViewAuthHandler"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private applicationId:Ljava/lang/String;

.field private e2e:Ljava/lang/String;

.field private transient loginDialog:Lcom/facebook/widget/WebDialog;

.field final synthetic this$0:Lcom/facebook/AuthorizationClient;


# direct methods
.method constructor <init>(Lcom/facebook/AuthorizationClient;)V
    .registers 2

    .prologue
    .line 561
    iput-object p1, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    invoke-direct {p0, p1}, Lcom/facebook/AuthorizationClient$AuthHandler;-><init>(Lcom/facebook/AuthorizationClient;)V

    return-void
.end method

.method private loadCookieToken()Ljava/lang/String;
    .registers 5

    .prologue
    .line 694
    iget-object v2, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    invoke-virtual {v2}, Lcom/facebook/AuthorizationClient;->getStartActivityDelegate()Lcom/facebook/AuthorizationClient$StartActivityDelegate;

    move-result-object v2

    invoke-interface {v2}, Lcom/facebook/AuthorizationClient$StartActivityDelegate;->getActivityContext()Landroid/app/Activity;

    move-result-object v0

    .line 696
    .local v0, "context":Landroid/content/Context;
    const-string v2, "com.facebook.AuthorizationClient.WebViewAuthHandler.TOKEN_STORE_KEY"

    .line 697
    const/4 v3, 0x0

    .line 695
    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 698
    .local v1, "sharedPreferences":Landroid/content/SharedPreferences;
    const-string v2, "TOKEN"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private saveCookieToken(Ljava/lang/String;)V
    .registers 7
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 682
    iget-object v3, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    invoke-virtual {v3}, Lcom/facebook/AuthorizationClient;->getStartActivityDelegate()Lcom/facebook/AuthorizationClient$StartActivityDelegate;

    move-result-object v3

    invoke-interface {v3}, Lcom/facebook/AuthorizationClient$StartActivityDelegate;->getActivityContext()Landroid/app/Activity;

    move-result-object v0

    .line 684
    .local v0, "context":Landroid/content/Context;
    const-string v3, "com.facebook.AuthorizationClient.WebViewAuthHandler.TOKEN_STORE_KEY"

    .line 685
    const/4 v4, 0x0

    .line 683
    invoke-virtual {v0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 686
    .local v2, "sharedPreferences":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 687
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v3, "TOKEN"

    invoke-interface {v1, v3, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 688
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v3

    if-nez v3, :cond_27

    .line 689
    const-string v3, "Facebook-AuthorizationClient"

    const-string v4, "Could not update saved web view auth handler token."

    invoke-static {v3, v4}, Lcom/facebook/internal/Utility;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 691
    :cond_27
    return-void
.end method


# virtual methods
.method cancel()V
    .registers 2

    .prologue
    .line 586
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->loginDialog:Lcom/facebook/widget/WebDialog;

    if-eqz v0, :cond_c

    .line 587
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->loginDialog:Lcom/facebook/widget/WebDialog;

    invoke-virtual {v0}, Lcom/facebook/widget/WebDialog;->dismiss()V

    .line 588
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->loginDialog:Lcom/facebook/widget/WebDialog;

    .line 590
    :cond_c
    return-void
.end method

.method getNameForLogging()Ljava/lang/String;
    .registers 2

    .prologue
    .line 569
    const-string v0, "web_view"

    return-object v0
.end method

.method needsInternetPermission()Z
    .registers 2

    .prologue
    .line 581
    const/4 v0, 0x1

    return v0
.end method

.method needsRestart()Z
    .registers 2

    .prologue
    .line 576
    const/4 v0, 0x1

    return v0
.end method

.method onWebDialogComplete(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Landroid/os/Bundle;Lcom/facebook/FacebookException;)V
    .registers 15
    .param p1, "request"    # Lcom/facebook/AuthorizationClient$AuthorizationRequest;
    .param p2, "values"    # Landroid/os/Bundle;
    .param p3, "error"    # Lcom/facebook/FacebookException;

    .prologue
    const/4 v10, 0x0

    .line 640
    if-eqz p2, :cond_4e

    .line 642
    const-string v6, "e2e"

    invoke-virtual {p2, v6}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_13

    .line 643
    const-string v6, "e2e"

    invoke-virtual {p2, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->e2e:Ljava/lang/String;

    .line 647
    :cond_13
    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getPermissions()Ljava/util/List;

    move-result-object v6

    sget-object v7, Lcom/facebook/AccessTokenSource;->WEB_VIEW:Lcom/facebook/AccessTokenSource;

    invoke-static {v6, p2, v7}, Lcom/facebook/AccessToken;->createFromWebBundle(Ljava/util/List;Landroid/os/Bundle;Lcom/facebook/AccessTokenSource;)Lcom/facebook/AccessToken;

    move-result-object v5

    .line 648
    .local v5, "token":Lcom/facebook/AccessToken;
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v6, v6, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    invoke-static {v6, v5}, Lcom/facebook/AuthorizationClient$Result;->createTokenResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Lcom/facebook/AccessToken;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v2

    .line 653
    .local v2, "outcome":Lcom/facebook/AuthorizationClient$Result;
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v6, v6, Lcom/facebook/AuthorizationClient;->context:Landroid/content/Context;

    invoke-static {v6}, Landroid/webkit/CookieSyncManager;->createInstance(Landroid/content/Context;)Landroid/webkit/CookieSyncManager;

    move-result-object v4

    .line 654
    .local v4, "syncManager":Landroid/webkit/CookieSyncManager;
    invoke-virtual {v4}, Landroid/webkit/CookieSyncManager;->sync()V

    .line 655
    invoke-virtual {v5}, Lcom/facebook/AccessToken;->getToken()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->saveCookieToken(Ljava/lang/String;)V

    .line 674
    .end local v4    # "syncManager":Landroid/webkit/CookieSyncManager;
    .end local v5    # "token":Lcom/facebook/AccessToken;
    .end local p3    # "error":Lcom/facebook/FacebookException;
    :goto_37
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->e2e:Ljava/lang/String;

    invoke-static {v6}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_48

    .line 675
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v7, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->applicationId:Ljava/lang/String;

    iget-object v8, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->e2e:Ljava/lang/String;

    # invokes: Lcom/facebook/AuthorizationClient;->logWebLoginCompleted(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v6, v7, v8}, Lcom/facebook/AuthorizationClient;->access$1(Lcom/facebook/AuthorizationClient;Ljava/lang/String;Ljava/lang/String;)V

    .line 678
    :cond_48
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    invoke-virtual {v6, v2}, Lcom/facebook/AuthorizationClient;->completeAndValidate(Lcom/facebook/AuthorizationClient$Result;)V

    .line 679
    return-void

    .line 657
    .end local v2    # "outcome":Lcom/facebook/AuthorizationClient$Result;
    .restart local p3    # "error":Lcom/facebook/FacebookException;
    :cond_4e
    instance-of v6, p3, Lcom/facebook/FacebookOperationCanceledException;

    if-eqz v6, :cond_5d

    .line 658
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v6, v6, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    const-string v7, "User canceled log in."

    invoke-static {v6, v7}, Lcom/facebook/AuthorizationClient$Result;->createCancelResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Ljava/lang/String;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v2

    .line 659
    .restart local v2    # "outcome":Lcom/facebook/AuthorizationClient$Result;
    goto :goto_37

    .line 661
    .end local v2    # "outcome":Lcom/facebook/AuthorizationClient$Result;
    :cond_5d
    iput-object v10, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->e2e:Ljava/lang/String;

    .line 663
    const/4 v0, 0x0

    .line 664
    .local v0, "errorCode":Ljava/lang/String;
    invoke-virtual {p3}, Lcom/facebook/FacebookException;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 665
    .local v1, "errorMessage":Ljava/lang/String;
    instance-of v6, p3, Lcom/facebook/FacebookServiceException;

    if-eqz v6, :cond_86

    .line 666
    check-cast p3, Lcom/facebook/FacebookServiceException;

    .end local p3    # "error":Lcom/facebook/FacebookException;
    invoke-virtual {p3}, Lcom/facebook/FacebookServiceException;->getRequestError()Lcom/facebook/FacebookRequestError;

    move-result-object v3

    .line 667
    .local v3, "requestError":Lcom/facebook/FacebookRequestError;
    const-string v6, "%d"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {v3}, Lcom/facebook/FacebookRequestError;->getErrorCode()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 668
    invoke-virtual {v3}, Lcom/facebook/FacebookRequestError;->toString()Ljava/lang/String;

    move-result-object v1

    .line 670
    .end local v3    # "requestError":Lcom/facebook/FacebookRequestError;
    :cond_86
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v6, v6, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    invoke-static {v6, v10, v1, v0}, Lcom/facebook/AuthorizationClient$Result;->createErrorResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v2

    .restart local v2    # "outcome":Lcom/facebook/AuthorizationClient$Result;
    goto :goto_37
.end method

.method tryAuthorize(Lcom/facebook/AuthorizationClient$AuthorizationRequest;)Z
    .registers 11
    .param p1, "request"    # Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    .prologue
    .line 594
    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getApplicationId()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->applicationId:Ljava/lang/String;

    .line 595
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 596
    .local v3, "parameters":Landroid/os/Bundle;
    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getPermissions()Ljava/util/List;

    move-result-object v6

    invoke-static {v6}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/util/Collection;)Z

    move-result v6

    if-nez v6, :cond_29

    .line 597
    const-string v6, ","

    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getPermissions()Ljava/util/List;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    .line 598
    .local v5, "scope":Ljava/lang/String;
    const-string v6, "scope"

    invoke-virtual {v3, v6, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 599
    const-string v6, "scope"

    invoke-virtual {p0, v6, v5}, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->addLoggingExtra(Ljava/lang/String;Ljava/lang/Object;)V

    .line 602
    .end local v5    # "scope":Ljava/lang/String;
    :cond_29
    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getDefaultAudience()Lcom/facebook/SessionDefaultAudience;

    move-result-object v0

    .line 603
    .local v0, "audience":Lcom/facebook/SessionDefaultAudience;
    const-string v6, "default_audience"

    invoke-virtual {v0}, Lcom/facebook/SessionDefaultAudience;->getNativeProtocolAudience()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 605
    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getPreviousAccessToken()Ljava/lang/String;

    move-result-object v4

    .line 606
    .local v4, "previousToken":Ljava/lang/String;
    invoke-static {v4}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_9a

    invoke-direct {p0}, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->loadCookieToken()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9a

    .line 607
    const-string v6, "access_token"

    invoke-virtual {v3, v6, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 609
    const-string v6, "access_token"

    const-string v7, "1"

    invoke-virtual {p0, v6, v7}, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->addLoggingExtra(Ljava/lang/String;Ljava/lang/Object;)V

    .line 616
    :goto_56
    new-instance v2, Lcom/facebook/AuthorizationClient$WebViewAuthHandler$1;

    invoke-direct {v2, p0, p1}, Lcom/facebook/AuthorizationClient$WebViewAuthHandler$1;-><init>(Lcom/facebook/AuthorizationClient$WebViewAuthHandler;Lcom/facebook/AuthorizationClient$AuthorizationRequest;)V

    .line 623
    .local v2, "listener":Lcom/facebook/widget/WebDialog$OnCompleteListener;
    # invokes: Lcom/facebook/AuthorizationClient;->getE2E()Ljava/lang/String;
    invoke-static {}, Lcom/facebook/AuthorizationClient;->access$0()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->e2e:Ljava/lang/String;

    .line 624
    const-string v6, "e2e"

    iget-object v7, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->e2e:Ljava/lang/String;

    invoke-virtual {p0, v6, v7}, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->addLoggingExtra(Ljava/lang/String;Ljava/lang/Object;)V

    .line 627
    new-instance v6, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;

    iget-object v7, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    invoke-virtual {v7}, Lcom/facebook/AuthorizationClient;->getStartActivityDelegate()Lcom/facebook/AuthorizationClient$StartActivityDelegate;

    move-result-object v7

    invoke-interface {v7}, Lcom/facebook/AuthorizationClient$StartActivityDelegate;->getActivityContext()Landroid/app/Activity;

    move-result-object v7

    iget-object v8, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->applicationId:Ljava/lang/String;

    invoke-direct {v6, v7, v8, v3}, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 628
    iget-object v7, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->e2e:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;->setE2E(Ljava/lang/String;)Lcom/facebook/AuthorizationClient$AuthDialogBuilder;

    move-result-object v6

    .line 629
    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isRerequest()Z

    move-result v7

    invoke-virtual {v6, v7}, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;->setIsRerequest(Z)Lcom/facebook/AuthorizationClient$AuthDialogBuilder;

    move-result-object v6

    .line 630
    invoke-virtual {v6, v2}, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;->setOnCompleteListener(Lcom/facebook/widget/WebDialog$OnCompleteListener;)Lcom/facebook/widget/WebDialog$BuilderBase;

    move-result-object v1

    check-cast v1, Lcom/facebook/widget/WebDialog$Builder;

    .line 631
    .local v1, "builder":Lcom/facebook/widget/WebDialog$Builder;
    invoke-virtual {v1}, Lcom/facebook/widget/WebDialog$Builder;->build()Lcom/facebook/widget/WebDialog;

    move-result-object v6

    iput-object v6, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->loginDialog:Lcom/facebook/widget/WebDialog;

    .line 632
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->loginDialog:Lcom/facebook/widget/WebDialog;

    invoke-virtual {v6}, Lcom/facebook/widget/WebDialog;->show()V

    .line 634
    const/4 v6, 0x1

    return v6

    .line 612
    .end local v1    # "builder":Lcom/facebook/widget/WebDialog$Builder;
    .end local v2    # "listener":Lcom/facebook/widget/WebDialog$OnCompleteListener;
    :cond_9a
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v6, v6, Lcom/facebook/AuthorizationClient;->context:Landroid/content/Context;

    invoke-static {v6}, Lcom/facebook/internal/Utility;->clearFacebookCookies(Landroid/content/Context;)V

    .line 613
    const-string v6, "access_token"

    const-string v7, "0"

    invoke-virtual {p0, v6, v7}, Lcom/facebook/AuthorizationClient$WebViewAuthHandler;->addLoggingExtra(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_56
.end method
