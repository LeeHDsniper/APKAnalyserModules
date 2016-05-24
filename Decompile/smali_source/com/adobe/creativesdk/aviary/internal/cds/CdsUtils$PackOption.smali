.class public final enum Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;
.super Ljava/lang/Enum;
.source "CdsUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PackOption"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

.field public static final enum DOWNLOADING:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

.field public static final enum DOWNLOAD_COMPLETE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

.field public static final enum DOWNLOAD_ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

.field public static final enum ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

.field public static final enum FREE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

.field public static final enum FREE_WITH_LOGIN:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

.field public static final enum OWNED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

.field public static final enum PACK_OPTION_BEING_DETERMINED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

.field public static final enum PURCHASE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

.field public static final enum RESTORE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

.field public static final enum UNINSTALL:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 50
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    const-string v1, "PURCHASE"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->PURCHASE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 52
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    const-string v1, "FREE"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 54
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    const-string v1, "FREE_WITH_LOGIN"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE_WITH_LOGIN:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 56
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    const-string v1, "RESTORE"

    invoke-direct {v0, v1, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->RESTORE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 58
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    const-string v1, "OWNED"

    invoke-direct {v0, v1, v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->OWNED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 60
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    const-string v1, "UNINSTALL"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->UNINSTALL:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 61
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    const-string v1, "PACK_OPTION_BEING_DETERMINED"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->PACK_OPTION_BEING_DETERMINED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 63
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    const-string v1, "ERROR"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 65
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    const-string v1, "DOWNLOADING"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOADING:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 67
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    const-string v1, "DOWNLOAD_ERROR"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOAD_ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 69
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    const-string v1, "DOWNLOAD_COMPLETE"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOAD_COMPLETE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 47
    const/16 v0, 0xb

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->PURCHASE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE_WITH_LOGIN:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->RESTORE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->OWNED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->UNINSTALL:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->PACK_OPTION_BEING_DETERMINED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOADING:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOAD_ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOAD_COMPLETE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

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
    .line 47
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static fromDownloadManagerStatus(I)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;
    .registers 2
    .param p0, "status"    # I

    .prologue
    .line 123
    sparse-switch p0, :sswitch_data_e

    .line 133
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 126
    :sswitch_5
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOAD_ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    goto :goto_4

    .line 129
    :sswitch_8
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOADING:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    goto :goto_4

    .line 131
    :sswitch_b
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOAD_COMPLETE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    goto :goto_4

    .line 123
    :sswitch_data_e
    .sparse-switch
        0x1 -> :sswitch_8
        0x2 -> :sswitch_8
        0x4 -> :sswitch_5
        0x8 -> :sswitch_b
        0x10 -> :sswitch_5
    .end sparse-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 47
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;
    .registers 1

    .prologue
    .line 47
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    return-object v0
.end method
