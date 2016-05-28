.class public Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "AmpDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AmpWebViewClient"
.end annotation


# instance fields
.field private mActivity:Landroid/app/Activity;

.field final synthetic this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;


# direct methods
.method public constructor <init>(Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;Landroid/app/Activity;)V
    .registers 3
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 870
    iput-object p1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 871
    iput-object p2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->mActivity:Landroid/app/Activity;

    .line 872
    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 13
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    const/high16 v9, 0x3f000000

    .line 877
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v7, v7, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    iget-object v7, v7, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->this$0:Lcom/localytics/android/AmpDialogFragment;

    # getter for: Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;
    invoke-static {v7}, Lcom/localytics/android/AmpDialogFragment;->access$200(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/Map;

    move-result-object v7

    const-string v8, "location"

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 878
    .local v0, "location":Ljava/lang/String;
    const-string v7, "center"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_d9

    const/high16 v7, 0x41200000

    iget-object v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v8, v8, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    # getter for: Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->access$600(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v7, v8

    add-float/2addr v7, v9

    float-to-int v7, v7

    shl-int/lit8 v1, v7, 0x1

    .line 879
    .local v1, "margin":I
    :goto_2e
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v7, v7, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    # getter for: Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v7}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->access$600(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v8, v8, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    # getter for: Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->access$600(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    sub-int v3, v7, v1

    .line 880
    .local v3, "maxWidth":I
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v7, v7, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    # getter for: Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v7}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->access$600(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v8, v8, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    # getter for: Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->access$600(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    sub-int v2, v7, v1

    .line 881
    .local v2, "maxHeight":I
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v7, v7, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    # getter for: Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWidth:F
    invoke-static {v7}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->access$700(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)F

    move-result v7

    iget-object v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v8, v8, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    # getter for: Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->access$600(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v7, v8

    add-float/2addr v7, v9

    float-to-int v7, v7

    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    int-to-float v7, v7

    iget-object v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v8, v8, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    # getter for: Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->access$600(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    div-float v5, v7, v8

    .line 882
    .local v5, "viewportWidth":F
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v7, v7, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    # getter for: Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mHeight:F
    invoke-static {v7}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->access$800(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)F

    move-result v7

    iget-object v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v8, v8, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    # getter for: Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->access$600(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v7, v8

    add-float/2addr v7, v9

    float-to-int v7, v7

    invoke-static {v2, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    int-to-float v7, v7

    iget-object v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v8, v8, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    # getter for: Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->access$600(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    div-float v4, v7, v8

    .line 884
    .local v4, "viewportHeight":F
    const-string v7, "javascript:(function() {  var viewportNode = document.createElement(\'meta\');  viewportNode.name    = \'viewport\';  viewportNode.content = \'width=%f, height=%f, user-scalable=no, minimum-scale=.25, maximum-scale=1\';  viewportNode.id      = \'metatag\';  document.getElementsByTagName(\'head\')[0].appendChild(viewportNode);})()"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    aput-object v9, v8, v6

    const/4 v6, 0x1

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    aput-object v9, v8, v6

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 894
    iget-object v6, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v6, v6, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    iget-object v6, v6, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->this$0:Lcom/localytics/android/AmpDialogFragment;

    # getter for: Lcom/localytics/android/AmpDialogFragment;->mJavaScriptClient:Lcom/localytics/android/JavaScriptClient;
    invoke-static {v6}, Lcom/localytics/android/AmpDialogFragment;->access$500(Lcom/localytics/android/AmpDialogFragment;)Lcom/localytics/android/JavaScriptClient;

    move-result-object v6

    invoke-virtual {v6}, Lcom/localytics/android/JavaScriptClient;->getJsGlueCode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 895
    return-void

    .end local v1    # "margin":I
    .end local v2    # "maxHeight":I
    .end local v3    # "maxWidth":I
    .end local v4    # "viewportHeight":F
    .end local v5    # "viewportWidth":F
    :cond_d9
    move v1, v6

    .line 878
    goto/16 :goto_2e
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .registers 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 900
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->this$2:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v0, v0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    iget-object v0, v0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->this$0:Lcom/localytics/android/AmpDialogFragment;

    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView$AmpWebViewClient;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p2, v1}, Lcom/localytics/android/AmpDialogFragment;->handleUrl(Ljava/lang/String;Landroid/app/Activity;)Z

    move-result v0

    return v0
.end method
