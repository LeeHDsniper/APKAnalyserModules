.class public Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;
.super Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;
.source "AdobeStorageTimeIndexCollation.java"


# instance fields
.field private sectionIndexTitlesArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private sectionTitlesArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;-><init>()V

    return-void
.end method

.method private ConvertDateToFormat(Ljava/lang/String;Ljava/util/Date;)Ljava/lang/String;
    .registers 5
    .param p1, "indexDateFormatter"    # Ljava/lang/String;
    .param p2, "date"    # Ljava/util/Date;

    .prologue
    .line 279
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 280
    .local v0, "dataformatter":Ljava/text/SimpleDateFormat;
    invoke-virtual {v0, p2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private calcDifferenceInDaysFromToday(Ljava/util/Date;Ljava/util/Calendar;)J
    .registers 15
    .param p1, "dateToCompare"    # Ljava/util/Date;
    .param p2, "todayCalendar"    # Ljava/util/Calendar;

    .prologue
    .line 265
    invoke-virtual {p2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v8

    .line 267
    .local v8, "todayDate":Ljava/util/Date;
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    .line 268
    .local v6, "startTime":J
    invoke-virtual {v8}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    .line 269
    .local v4, "endTime":J
    sub-long v2, v4, v6

    .line 270
    .local v2, "diffTime":J
    const-wide/32 v10, 0x5265c00

    div-long v0, v2, v10

    .line 273
    .local v0, "diffDays":J
    return-wide v0
.end method

.method private createSectionTitlesAndAssignSectionsToData(Ljava/util/ArrayList;)V
    .registers 32
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p1, "sortedItemDataArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;"
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v8

    .line 111
    .local v8, "calendar":Ljava/util/Calendar;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v13

    .line 112
    .local v13, "locale":Ljava/util/Locale;
    invoke-virtual {v8}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v25

    .line 114
    .local v25, "timeZone":Ljava/util/TimeZone;
    const/16 v17, -0x1

    .line 115
    .local v17, "previousYear":I
    const/16 v16, -0x1

    .line 116
    .local v16, "previousMonth":I
    const/4 v15, -0x1

    .line 118
    .local v15, "previousDay":I
    const/16 v27, 0x1

    move/from16 v0, v27

    invoke-virtual {v8, v0}, Ljava/util/Calendar;->get(I)I

    move-result v24

    .line 119
    .local v24, "thisYear":I
    const/16 v27, 0x2

    move/from16 v0, v27

    invoke-virtual {v8, v0}, Ljava/util/Calendar;->get(I)I

    move-result v27

    add-int/lit8 v23, v27, 0x1

    .line 120
    .local v23, "thisMonth":I
    const/16 v27, 0x5

    move/from16 v0, v27

    invoke-virtual {v8, v0}, Ljava/util/Calendar;->get(I)I

    move-result v22

    .line 122
    .local v22, "thisDay":I
    const/4 v6, 0x0

    .line 123
    .local v6, "bThisWeek":Z
    const/4 v4, 0x0

    .line 124
    .local v4, "bLastWeek":Z
    const/4 v5, 0x0

    .line 127
    .local v5, "bThisMonth":Z
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v7

    .line 130
    .local v7, "cal":Ljava/util/Calendar;
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v27

    :goto_36
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_1a7

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;

    .line 131
    .local v19, "sectionData":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;
    move-object/from16 v0, v19

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->modificationDate:Ljava/util/Date;

    .line 135
    .local v9, "date":Ljava/util/Date;
    if-nez v9, :cond_79

    .line 136
    sget v28, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_CAPTION_COLLATION_UNKNOWN_DATE:I

    invoke-static/range {v28 .. v28}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v20

    .line 137
    .local v20, "sectionHeading":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->sectionTitlesArray:Ljava/util/ArrayList;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->sectionIndexTitlesArray:Ljava/util/ArrayList;

    move-object/from16 v28, v0

    const-string v29, "U"

    invoke-virtual/range {v28 .. v29}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->sectionIndexTitlesArray:Ljava/util/ArrayList;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->size()I

    move-result v28

    add-int/lit8 v28, v28, -0x1

    move/from16 v0, v28

    move-object/from16 v1, v19

    iput v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->sectionNumber:I

    goto :goto_36

    .line 146
    .end local v20    # "sectionHeading":Ljava/lang/String;
    :cond_79
    invoke-virtual {v7, v9}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 147
    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v7, v0}, Ljava/util/Calendar;->get(I)I

    move-result v26

    .line 148
    .local v26, "year":I
    const/16 v28, 0x2

    move/from16 v0, v28

    invoke-virtual {v7, v0}, Ljava/util/Calendar;->get(I)I

    move-result v28

    add-int/lit8 v14, v28, 0x1

    .line 149
    .local v14, "month":I
    const/16 v28, 0x5

    move/from16 v0, v28

    invoke-virtual {v7, v0}, Ljava/util/Calendar;->get(I)I

    move-result v11

    .line 151
    .local v11, "day":I
    const/16 v20, 0x0

    .line 152
    .restart local v20    # "sectionHeading":Ljava/lang/String;
    const/16 v21, 0x0

    .line 154
    .local v21, "sectionIndexTitle":Ljava/lang/String;
    move/from16 v0, v26

    move/from16 v1, v17

    if-ne v0, v1, :cond_a6

    move/from16 v0, v16

    if-ne v14, v0, :cond_a6

    if-eq v11, v15, :cond_e5

    .line 156
    :cond_a6
    move-object/from16 v0, p0

    invoke-direct {v0, v9, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->calcDifferenceInDaysFromToday(Ljava/util/Date;Ljava/util/Calendar;)J

    move-result-wide v2

    .line 158
    .local v2, "ageInDays":J
    move/from16 v0, v26

    move/from16 v1, v24

    if-ne v0, v1, :cond_f9

    move/from16 v0, v23

    if-ne v14, v0, :cond_f9

    move/from16 v0, v22

    if-ne v11, v0, :cond_f9

    .line 160
    const-string v21, "TD"

    .line 161
    sget v28, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_CAPTION_COLLATION_UPDATED_TODAY:I

    invoke-static/range {v28 .. v28}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v20

    .line 205
    :cond_c2
    :goto_c2
    if-eqz v20, :cond_d1

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->sectionTitlesArray:Ljava/util/ArrayList;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 209
    :cond_d1
    if-eqz v21, :cond_e0

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->sectionIndexTitlesArray:Ljava/util/ArrayList;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 213
    :cond_e0
    move/from16 v17, v26

    .line 214
    move/from16 v16, v14

    .line 215
    move v15, v11

    .line 218
    .end local v2    # "ageInDays":J
    :cond_e5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->sectionTitlesArray:Ljava/util/ArrayList;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->size()I

    move-result v28

    add-int/lit8 v28, v28, -0x1

    move/from16 v0, v28

    move-object/from16 v1, v19

    iput v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->sectionNumber:I

    goto/16 :goto_36

    .line 162
    .restart local v2    # "ageInDays":J
    :cond_f9
    const-wide/16 v28, 0x6

    cmp-long v28, v2, v28

    if-gtz v28, :cond_10b

    .line 164
    if-nez v6, :cond_c2

    .line 165
    const/4 v6, 0x1

    .line 166
    const-string v21, "TW"

    .line 167
    sget v28, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_CAPTION_COLLATION_UPDATED_THIS_WEEK:I

    invoke-static/range {v28 .. v28}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v20

    goto :goto_c2

    .line 169
    :cond_10b
    const-wide/16 v28, 0xd

    cmp-long v28, v2, v28

    if-gtz v28, :cond_11d

    .line 171
    if-nez v4, :cond_c2

    .line 172
    const/4 v4, 0x1

    .line 173
    const-string v21, "LW"

    .line 174
    sget v28, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_CAPTION_COLLATION_UPDATED_LAST_WEEK:I

    invoke-static/range {v28 .. v28}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v20

    goto :goto_c2

    .line 176
    :cond_11d
    move/from16 v0, v26

    move/from16 v1, v24

    if-ne v0, v1, :cond_133

    move/from16 v0, v23

    if-ne v14, v0, :cond_133

    .line 178
    if-nez v5, :cond_c2

    .line 179
    const/4 v5, 0x1

    .line 180
    const-string v21, "TM"

    .line 181
    sget v28, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_CAPTION_COLLATION_UPDATED_THIS_MONTH:I

    invoke-static/range {v28 .. v28}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v20

    goto :goto_c2

    .line 183
    :cond_133
    move/from16 v0, v26

    move/from16 v1, v24

    if-ne v0, v1, :cond_16f

    move/from16 v0, v16

    if-eq v14, v0, :cond_16f

    .line 186
    const-string v28, "MM/yy"

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v9}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->ConvertDateToFormat(Ljava/lang/String;Ljava/util/Date;)Ljava/lang/String;

    move-result-object v21

    .line 189
    sget v28, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_CAPTION_COLLATION_UPDATED_DATE:I

    invoke-static/range {v28 .. v28}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v12

    .line 190
    .local v12, "locStr":Ljava/lang/String;
    const-string v28, "MMMM yyyy"

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v9}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->ConvertDateToFormat(Ljava/lang/String;Ljava/util/Date;)Ljava/lang/String;

    move-result-object v18

    .line 191
    .local v18, "resultMonthString":Ljava/lang/String;
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v10

    .line 192
    .local v10, "dateStr":Ljava/lang/String;
    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    aput-object v10, v28, v29

    move-object/from16 v0, v28

    invoke-static {v12, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    .line 194
    goto/16 :goto_c2

    .end local v10    # "dateStr":Ljava/lang/String;
    .end local v12    # "locStr":Ljava/lang/String;
    .end local v18    # "resultMonthString":Ljava/lang/String;
    :cond_16f
    move/from16 v0, v26

    move/from16 v1, v17

    if-eq v0, v1, :cond_c2

    .line 196
    const-string v28, "yy"

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v9}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->ConvertDateToFormat(Ljava/lang/String;Ljava/util/Date;)Ljava/lang/String;

    move-result-object v21

    .line 198
    sget v28, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_CAPTION_COLLATION_UPDATED_DATE:I

    invoke-static/range {v28 .. v28}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v12

    .line 199
    .restart local v12    # "locStr":Ljava/lang/String;
    const-string v28, "yyyy"

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v9}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->ConvertDateToFormat(Ljava/lang/String;Ljava/util/Date;)Ljava/lang/String;

    move-result-object v18

    .line 200
    .restart local v18    # "resultMonthString":Ljava/lang/String;
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v10

    .line 201
    .restart local v10    # "dateStr":Ljava/lang/String;
    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    aput-object v10, v28, v29

    move-object/from16 v0, v28

    invoke-static {v12, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    goto/16 :goto_c2

    .line 221
    .end local v2    # "ageInDays":J
    .end local v9    # "date":Ljava/util/Date;
    .end local v10    # "dateStr":Ljava/lang/String;
    .end local v11    # "day":I
    .end local v12    # "locStr":Ljava/lang/String;
    .end local v14    # "month":I
    .end local v18    # "resultMonthString":Ljava/lang/String;
    .end local v19    # "sectionData":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;
    .end local v20    # "sectionHeading":Ljava/lang/String;
    .end local v21    # "sectionIndexTitle":Ljava/lang/String;
    .end local v26    # "year":I
    :cond_1a7
    return-void
.end method


# virtual methods
.method public createSectionDataFromMaster(Ljava/util/ArrayList;)Z
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 48
    .local p1, "masterArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->sectionIndexTitlesArray:Ljava/util/ArrayList;

    .line 49
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->sectionTitlesArray:Ljava/util/ArrayList;

    .line 50
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->sectionDataArray:Ljava/util/ArrayList;

    .line 52
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .local v4, "itemSectionDataArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;"
    if-nez p1, :cond_1e

    .line 56
    const/4 v8, 0x0

    .line 103
    :goto_1d
    return v8

    .line 59
    :cond_1e
    const/4 v2, 0x0

    .local v2, "index":I
    :goto_1f
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v2, v8, :cond_52

    .line 61
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 62
    .local v3, "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;

    invoke-direct {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;-><init>()V

    .line 63
    .local v7, "sectionData":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;
    iput v2, v7, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->originalIndex:I

    .line 64
    iput-object v3, v7, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->item:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 65
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->name:Ljava/lang/String;

    .line 66
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getModificationDate()Ljava/util/Date;

    move-result-object v8

    iput-object v8, v7, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->modificationDate:Ljava/util/Date;

    .line 68
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getModificationDate()Ljava/util/Date;

    move-result-object v8

    if-nez v8, :cond_4c

    .line 70
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getCreationDate()Ljava/util/Date;

    move-result-object v8

    iput-object v8, v7, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->modificationDate:Ljava/util/Date;

    .line 73
    :cond_4c
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 80
    .end local v3    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .end local v7    # "sectionData":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;
    :cond_52
    invoke-direct {p0, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->createSectionTitlesAndAssignSectionsToData(Ljava/util/ArrayList;)V

    .line 83
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->sectionTitles()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 84
    .local v0, "highSection":I
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .local v6, "sectionArrays":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_63
    if-ge v1, v0, :cond_70

    .line 88
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .local v5, "sectionArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;"
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    add-int/lit8 v1, v1, 0x1

    goto :goto_63

    .line 93
    .end local v5    # "sectionArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;"
    :cond_70
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_74
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_8c

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;

    .line 94
    .restart local v7    # "sectionData":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;
    iget v8, v7, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->sectionNumber:I

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_74

    .line 99
    .end local v7    # "sectionData":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;
    :cond_8c
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_90
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    .line 100
    .restart local v5    # "sectionArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;"
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->sectionDataArray:Ljava/util/ArrayList;

    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_90

    .line 103
    .end local v5    # "sectionArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;"
    :cond_a2
    const/4 v8, 0x1

    goto/16 :goto_1d
.end method

.method public sectionTitles()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 258
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;->sectionTitlesArray:Ljava/util/ArrayList;

    return-object v0
.end method
