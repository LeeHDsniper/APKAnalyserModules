.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetViewerPreferences;
.super Ljava/lang/Object;
.source "AdobeUXAssetViewerPreferences.java"


# static fields
.field private static _appIdentifierKey:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 6
    const-string v0, "177FCAA1-70EA-4FD7-B016-19D56F387C64"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetViewerPreferences;->_appIdentifierKey:Ljava/lang/String;

    return-void
.end method

.method static declared-synchronized getFileProvideAuthority()Ljava/lang/String;
    .registers 2

    .prologue
    .line 32
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetViewerPreferences;

    monitor-enter v0

    :try_start_3
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->getFileProvideAuthority()Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_9

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_9
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method static declared-synchronized isMenuEnabled()Z
    .registers 2

    .prologue
    .line 24
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetViewerPreferences;

    monitor-enter v1

    :try_start_3
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->getFileProvideAuthority()Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_e

    move-result-object v0

    if-eqz v0, :cond_c

    .line 25
    const/4 v0, 0x1

    .line 27
    :goto_a
    monitor-exit v1

    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_a

    .line 24
    :catchall_e
    move-exception v0

    monitor-exit v1

    throw v0
.end method
