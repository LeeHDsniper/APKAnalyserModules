.class public Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;
.super Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;
.source "BehanceSDKProjectFeaturedDTO.java"


# instance fields
.field private featuredDate:J

.field private projectUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;-><init>()V

    return-void
.end method


# virtual methods
.method public setFeaturedDate(J)V
    .registers 4
    .param p1, "featuredDate"    # J

    .prologue
    .line 36
    iput-wide p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;->featuredDate:J

    .line 37
    return-void
.end method

.method public setProjectUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;->projectUrl:Ljava/lang/String;

    .line 45
    return-void
.end method
