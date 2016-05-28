.class synthetic Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$8;
.super Ljava/lang/Object;
.source "StoreListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 187
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->values()[Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$8;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    :try_start_9
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$8;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->PURCHASE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_8d

    :goto_14
    :try_start_14
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$8;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE_WITH_LOGIN:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_8b

    :goto_1f
    :try_start_1f
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$8;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_2a} :catch_89

    :goto_2a
    :try_start_2a
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$8;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->RESTORE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_35
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2a .. :try_end_35} :catch_87

    :goto_35
    :try_start_35
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$8;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOAD_ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_40
    .catch Ljava/lang/NoSuchFieldError; {:try_start_35 .. :try_end_40} :catch_85

    :goto_40
    :try_start_40
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$8;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_4b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_40 .. :try_end_4b} :catch_83

    :goto_4b
    :try_start_4b
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$8;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->OWNED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_56
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4b .. :try_end_56} :catch_81

    :goto_56
    :try_start_56
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$8;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->PACK_OPTION_BEING_DETERMINED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_62
    .catch Ljava/lang/NoSuchFieldError; {:try_start_56 .. :try_end_62} :catch_7f

    :goto_62
    :try_start_62
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$8;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOADING:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_6e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_62 .. :try_end_6e} :catch_7d

    :goto_6e
    :try_start_6e
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$8;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOAD_COMPLETE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_7a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6e .. :try_end_7a} :catch_7b

    :goto_7a
    return-void

    :catch_7b
    move-exception v0

    goto :goto_7a

    :catch_7d
    move-exception v0

    goto :goto_6e

    :catch_7f
    move-exception v0

    goto :goto_62

    :catch_81
    move-exception v0

    goto :goto_56

    :catch_83
    move-exception v0

    goto :goto_4b

    :catch_85
    move-exception v0

    goto :goto_40

    :catch_87
    move-exception v0

    goto :goto_35

    :catch_89
    move-exception v0

    goto :goto_2a

    :catch_8b
    move-exception v0

    goto :goto_1f

    :catch_8d
    move-exception v0

    goto :goto_14
.end method
