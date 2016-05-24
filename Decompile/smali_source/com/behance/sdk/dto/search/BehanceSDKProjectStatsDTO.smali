.class public Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;
.super Ljava/lang/Object;
.source "BehanceSDKProjectStatsDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x4e269162245cf606L


# instance fields
.field private appreciationsCount:I

.field private commentsCount:I

.field private viewsCount:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public setAppreciationsCount(I)V
    .registers 2
    .param p1, "appreciationsCount"    # I

    .prologue
    .line 37
    iput p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;->appreciationsCount:I

    .line 38
    return-void
.end method

.method public setCommentsCount(I)V
    .registers 2
    .param p1, "commentsCount"    # I

    .prologue
    .line 53
    iput p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;->commentsCount:I

    .line 54
    return-void
.end method

.method public setViewsCount(I)V
    .registers 2
    .param p1, "viewsCount"    # I

    .prologue
    .line 45
    iput p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;->viewsCount:I

    .line 46
    return-void
.end method
