.class Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$1;
.super Landroid/webkit/WebViewClient;
.source "BehanceSDKLoginToTwitterFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->setWebViewforAuthorization(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 166
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 167
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->displayNoInternetConnectivity()V
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->access$100(Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;)V

    .line 168
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .registers 4
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 156
    if-eqz p2, :cond_16

    const-string v0, "com.behance.behance://oauth.callback"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 157
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->retrieveTokenFromURLCallback(Ljava/lang/String;)V
    invoke-static {v0, p2}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;Ljava/lang/String;)V

    .line 158
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 159
    const/4 v0, 0x1

    .line 161
    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
