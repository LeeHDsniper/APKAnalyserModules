.class public final enum Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;
.super Ljava/lang/Enum;
.source "AdobeStorageDataSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DataSourceInternalFilters"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

.field public static final enum FilterOnlyFiles:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

.field public static final enum FilterOnlyFolders:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 97
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    const-string v1, "FilterOnlyFolders"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;->FilterOnlyFolders:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    .line 98
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    const-string v1, "FilterOnlyFiles"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;->FilterOnlyFiles:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    .line 95
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;->FilterOnlyFolders:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;->FilterOnlyFiles:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 95
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 95
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;
    .registers 1

    .prologue
    .line 95
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    return-object v0
.end method
