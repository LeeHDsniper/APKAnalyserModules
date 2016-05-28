.class public interface abstract Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;
.super Ljava/lang/Object;
.source "BehanceSDKEditProfileHeadlessFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callbacks"
.end annotation


# virtual methods
.method public abstract onEditProfileFailure(Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;)V
.end method

.method public abstract onEditProfileSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;)V
.end method

.method public abstract onGetUserProfileFailure(Ljava/lang/Exception;Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;)V
.end method

.method public abstract onGetUserProfileSuccess()V
.end method
