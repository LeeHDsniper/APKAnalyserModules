.class Lcom/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "AdobeAuthSignInActivity.java"


# instance fields
.field private _authClientResultHandler:Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

.field authorizationCode:Ljava/lang/String;

.field deviceToken:Ljava/lang/String;

.field signInView:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;)V
    .registers 3
    .param p1, "adobeUXAuthView"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    .prologue
    .line 69
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 64
    const-string v0, "code"

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient;->authorizationCode:Ljava/lang/String;

    .line 65
    const-string v0, "device_token"

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient;->deviceToken:Ljava/lang/String;

    .line 70
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient;->signInView:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    .line 71
    return-void
.end method

.method private handleOverrideUrlCommon(Ljava/lang/String;)Z
    .registers 9
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 98
    const/4 v2, 0x0

    .line 99
    .local v2, "ret":Z
    new-instance v4, Landroid/net/UrlQuerySanitizer;

    invoke-direct {v4, p1}, Landroid/net/UrlQuerySanitizer;-><init>(Ljava/lang/String;)V

    .line 100
    .local v4, "urlSanitizer1":Landroid/net/UrlQuerySanitizer;
    invoke-virtual {v4}, Landroid/net/UrlQuerySanitizer;->getParameterList()Ljava/util/List;

    move-result-object v3

    .line 102
    .local v3, "urlParamsList1":Ljava/util/List;, "Ljava/util/List<Landroid/net/UrlQuerySanitizer$ParameterValuePair;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_3f

    .line 104
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/UrlQuerySanitizer$ParameterValuePair;

    .line 106
    .local v1, "paramPair":Landroid/net/UrlQuerySanitizer$ParameterValuePair;
    iget-object v5, v1, Landroid/net/UrlQuerySanitizer$ParameterValuePair;->mParameter:Ljava/lang/String;

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient;->authorizationCode:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 108
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient;->_authClientResultHandler:Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    iget-object v6, v1, Landroid/net/UrlQuerySanitizer$ParameterValuePair;->mValue:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->handleAuthCodeReceived(Ljava/lang/String;)V

    .line 110
    const/4 v2, 0x1

    .line 102
    :cond_29
    :goto_29
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 112
    :cond_2c
    iget-object v5, v1, Landroid/net/UrlQuerySanitizer$ParameterValuePair;->mParameter:Ljava/lang/String;

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient;->deviceToken:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_29

    .line 114
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient;->_authClientResultHandler:Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    iget-object v6, v1, Landroid/net/UrlQuerySanitizer$ParameterValuePair;->mValue:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->handleDeviceTokenReceived(Ljava/lang/String;)V

    .line 116
    const/4 v2, 0x1

    goto :goto_29

    .line 120
    .end local v1    # "paramPair":Landroid/net/UrlQuerySanitizer$ParameterValuePair;
    :cond_3f
    return v2
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 7
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 76
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v1, "Authentication"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPageFinished:Webpage ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient;->signInView:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->pageLoaded()V

    .line 78
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 83
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "Authentication"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onReceivedError:Webpage Error="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " with webpage error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    const/4 v1, -0x1

    if-ne p2, v1, :cond_3c

    const-string v1, "net::ERR_CACHE_MISS"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3c

    .line 88
    new-instance v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_CANCELLED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    .line 89
    .local v0, "error":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient;->_authClientResultHandler:Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->handleResultFromIMS(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 94
    .end local v0    # "error":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;
    :goto_3b
    return-void

    .line 92
    :cond_3c
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient;->signInView:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->handleError()V

    goto :goto_3b
.end method

.method public setAuthResultHandler(Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;)V
    .registers 2
    .param p1, "authResultHandler"    # Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient;->_authClientResultHandler:Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    .line 157
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .registers 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 126
    const/4 v0, 0x0

    .line 131
    .local v0, "ret":Z
    invoke-direct {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient;->handleOverrideUrlCommon(Ljava/lang/String;)Z

    move-result v0

    .line 132
    return v0
.end method
