.class public interface abstract Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;
.super Ljava/lang/Object;
.source "BehanceSDKLoginToTwitterHeadlessFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callbacks"
.end annotation


# virtual methods
.method public abstract onGetAuthURLFromTwitterFailure(Ljava/lang/Exception;)V
.end method

.method public abstract onGetAuthURLFromTwitterSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;)V
.end method

.method public abstract onRetrieveAccessTokenFromTwitterFailure(Ljava/lang/Exception;)V
.end method

.method public abstract onRetrieveAccessTokenFromTwitterSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;)V
.end method
