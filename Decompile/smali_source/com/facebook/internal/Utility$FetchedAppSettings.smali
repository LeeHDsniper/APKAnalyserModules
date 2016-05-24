.class public Lcom/facebook/internal/Utility$FetchedAppSettings;
.super Ljava/lang/Object;
.source "Utility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/Utility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FetchedAppSettings"
.end annotation


# instance fields
.field private nuxContent:Ljava/lang/String;

.field private nuxEnabled:Z

.field private supportsAttribution:Z

.field private supportsImplicitLogging:Z


# direct methods
.method private constructor <init>(ZZLjava/lang/String;Z)V
    .registers 5
    .param p1, "supportsAttribution"    # Z
    .param p2, "supportsImplicitLogging"    # Z
    .param p3, "nuxContent"    # Ljava/lang/String;
    .param p4, "nuxEnabled"    # Z

    .prologue
    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    iput-boolean p1, p0, Lcom/facebook/internal/Utility$FetchedAppSettings;->supportsAttribution:Z

    .line 104
    iput-boolean p2, p0, Lcom/facebook/internal/Utility$FetchedAppSettings;->supportsImplicitLogging:Z

    .line 105
    iput-object p3, p0, Lcom/facebook/internal/Utility$FetchedAppSettings;->nuxContent:Ljava/lang/String;

    .line 106
    iput-boolean p4, p0, Lcom/facebook/internal/Utility$FetchedAppSettings;->nuxEnabled:Z

    .line 107
    return-void
.end method

.method synthetic constructor <init>(ZZLjava/lang/String;ZLcom/facebook/internal/Utility$FetchedAppSettings;)V
    .registers 6

    .prologue
    .line 99
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/facebook/internal/Utility$FetchedAppSettings;-><init>(ZZLjava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method public supportsAttribution()Z
    .registers 2

    .prologue
    .line 110
    iget-boolean v0, p0, Lcom/facebook/internal/Utility$FetchedAppSettings;->supportsAttribution:Z

    return v0
.end method

.method public supportsImplicitLogging()Z
    .registers 2

    .prologue
    .line 114
    iget-boolean v0, p0, Lcom/facebook/internal/Utility$FetchedAppSettings;->supportsImplicitLogging:Z

    return v0
.end method
