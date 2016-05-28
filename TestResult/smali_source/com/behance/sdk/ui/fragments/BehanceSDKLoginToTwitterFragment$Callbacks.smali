.class public interface abstract Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;
.super Ljava/lang/Object;
.source "BehanceSDKLoginToTwitterFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callbacks"
.end annotation


# virtual methods
.method public abstract onTwitterAuthenticationFailure(Ljava/lang/Exception;)V
.end method

.method public abstract onTwitterAuthenticationSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;)V
.end method
