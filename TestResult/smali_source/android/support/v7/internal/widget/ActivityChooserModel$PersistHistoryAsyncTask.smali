.class final Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;
.super Landroid/os/AsyncTask;
.source "ActivityChooserModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/internal/widget/ActivityChooserModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "PersistHistoryAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;


# direct methods
.method private constructor <init>(Landroid/support/v7/internal/widget/ActivityChooserModel;)V
    .registers 2

    .prologue
    .line 1037
    iput-object p1, p0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v7/internal/widget/ActivityChooserModel;Landroid/support/v7/internal/widget/ActivityChooserModel$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v7/internal/widget/ActivityChooserModel;
    .param p2, "x1"    # Landroid/support/v7/internal/widget/ActivityChooserModel$1;

    .prologue
    .line 1037
    invoke-direct {p0, p1}, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;-><init>(Landroid/support/v7/internal/widget/ActivityChooserModel;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 1037
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .registers 20
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1042
    const/4 v13, 0x0

    aget-object v4, p1, v13

    check-cast v4, Ljava/util/List;

    .line 1043
    .local v4, "historicalRecords":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;>;"
    const/4 v13, 0x1

    aget-object v5, p1, v13

    check-cast v5, Ljava/lang/String;

    .line 1045
    .local v5, "hostoryFileName":Ljava/lang/String;
    const/4 v3, 0x0

    .line 1048
    .local v3, "fos":Ljava/io/FileOutputStream;
    :try_start_b
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mContext:Landroid/content/Context;
    invoke-static {v13}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$200(Landroid/support/v7/internal/widget/ActivityChooserModel;)Landroid/content/Context;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v5, v14}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;
    :try_end_17
    .catch Ljava/io/FileNotFoundException; {:try_start_b .. :try_end_17} :catch_73

    move-result-object v3

    .line 1054
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v12

    .line 1057
    .local v12, "serializer":Lorg/xmlpull/v1/XmlSerializer;
    const/4 v13, 0x0

    :try_start_1d
    invoke-interface {v12, v3, v13}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 1058
    const-string v13, "UTF-8"

    const/4 v14, 0x1

    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    invoke-interface {v12, v13, v14}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1059
    const/4 v13, 0x0

    const-string v14, "historical-records"

    invoke-interface {v12, v13, v14}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1061
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v11

    .line 1062
    .local v11, "recordCount":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_35
    if-ge v6, v11, :cond_90

    .line 1063
    const/4 v13, 0x0

    invoke-interface {v4, v13}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;

    .line 1064
    .local v10, "record":Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;
    const/4 v13, 0x0

    const-string v14, "historical-record"

    invoke-interface {v12, v13, v14}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1065
    const/4 v13, 0x0

    const-string v14, "activity"

    iget-object v15, v10, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;->activity:Landroid/content/ComponentName;

    invoke-virtual {v15}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v12, v13, v14, v15}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1067
    const/4 v13, 0x0

    const-string v14, "time"

    iget-wide v0, v10, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;->time:J

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v12, v13, v14, v15}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1068
    const/4 v13, 0x0

    const-string v14, "weight"

    iget v15, v10, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;->weight:F

    invoke-static {v15}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v12, v13, v14, v15}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1069
    const/4 v13, 0x0

    const-string v14, "historical-record"

    invoke-interface {v12, v13, v14}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_70
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1d .. :try_end_70} :catch_a8
    .catch Ljava/lang/IllegalStateException; {:try_start_1d .. :try_end_70} :catch_db
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_70} :catch_10e
    .catchall {:try_start_1d .. :try_end_70} :catchall_143

    .line 1062
    add-int/lit8 v6, v6, 0x1

    goto :goto_35

    .line 1049
    .end local v6    # "i":I
    .end local v10    # "record":Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;
    .end local v11    # "recordCount":I
    .end local v12    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :catch_73
    move-exception v2

    .line 1050
    .local v2, "fnfe":Ljava/io/FileNotFoundException;
    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$300()Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Error writing historical recrod file: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1051
    const/4 v13, 0x0

    .line 1097
    .end local v2    # "fnfe":Ljava/io/FileNotFoundException;
    :goto_8f
    return-object v13

    .line 1075
    .restart local v6    # "i":I
    .restart local v11    # "recordCount":I
    .restart local v12    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :cond_90
    const/4 v13, 0x0

    :try_start_91
    const-string v14, "historical-records"

    invoke-interface {v12, v13, v14}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1076
    invoke-interface {v12}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V
    :try_end_99
    .catch Ljava/lang/IllegalArgumentException; {:try_start_91 .. :try_end_99} :catch_a8
    .catch Ljava/lang/IllegalStateException; {:try_start_91 .. :try_end_99} :catch_db
    .catch Ljava/io/IOException; {:try_start_91 .. :try_end_99} :catch_10e
    .catchall {:try_start_91 .. :try_end_99} :catchall_143

    .line 1088
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    const/4 v14, 0x1

    # setter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mCanReadHistoricalData:Z
    invoke-static {v13, v14}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$502(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z

    .line 1089
    if-eqz v3, :cond_a6

    .line 1091
    :try_start_a3
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_a6
    .catch Ljava/io/IOException; {:try_start_a3 .. :try_end_a6} :catch_152

    .line 1097
    .end local v6    # "i":I
    .end local v11    # "recordCount":I
    :cond_a6
    :goto_a6
    const/4 v13, 0x0

    goto :goto_8f

    .line 1081
    :catch_a8
    move-exception v7

    .line 1082
    .local v7, "iae":Ljava/lang/IllegalArgumentException;
    :try_start_a9
    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$300()Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Error writing historical recrod file: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static {v15}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$400(Landroid/support/v7/internal/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_cb
    .catchall {:try_start_a9 .. :try_end_cb} :catchall_143

    .line 1088
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    const/4 v14, 0x1

    # setter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mCanReadHistoricalData:Z
    invoke-static {v13, v14}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$502(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z

    .line 1089
    if-eqz v3, :cond_a6

    .line 1091
    :try_start_d5
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_d8
    .catch Ljava/io/IOException; {:try_start_d5 .. :try_end_d8} :catch_d9

    goto :goto_a6

    .line 1092
    :catch_d9
    move-exception v13

    goto :goto_a6

    .line 1083
    .end local v7    # "iae":Ljava/lang/IllegalArgumentException;
    :catch_db
    move-exception v9

    .line 1084
    .local v9, "ise":Ljava/lang/IllegalStateException;
    :try_start_dc
    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$300()Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Error writing historical recrod file: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static {v15}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$400(Landroid/support/v7/internal/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_fe
    .catchall {:try_start_dc .. :try_end_fe} :catchall_143

    .line 1088
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    const/4 v14, 0x1

    # setter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mCanReadHistoricalData:Z
    invoke-static {v13, v14}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$502(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z

    .line 1089
    if-eqz v3, :cond_a6

    .line 1091
    :try_start_108
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_10b
    .catch Ljava/io/IOException; {:try_start_108 .. :try_end_10b} :catch_10c

    goto :goto_a6

    .line 1092
    :catch_10c
    move-exception v13

    goto :goto_a6

    .line 1085
    .end local v9    # "ise":Ljava/lang/IllegalStateException;
    :catch_10e
    move-exception v8

    .line 1086
    .local v8, "ioe":Ljava/io/IOException;
    :try_start_10f
    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$300()Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Error writing historical recrod file: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static {v15}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$400(Landroid/support/v7/internal/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_131
    .catchall {:try_start_10f .. :try_end_131} :catchall_143

    .line 1088
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    const/4 v14, 0x1

    # setter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mCanReadHistoricalData:Z
    invoke-static {v13, v14}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$502(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z

    .line 1089
    if-eqz v3, :cond_a6

    .line 1091
    :try_start_13b
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_13e
    .catch Ljava/io/IOException; {:try_start_13b .. :try_end_13e} :catch_140

    goto/16 :goto_a6

    .line 1092
    :catch_140
    move-exception v13

    goto/16 :goto_a6

    .line 1088
    .end local v8    # "ioe":Ljava/io/IOException;
    :catchall_143
    move-exception v13

    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    const/4 v15, 0x1

    # setter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mCanReadHistoricalData:Z
    invoke-static {v14, v15}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$502(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z

    .line 1089
    if-eqz v3, :cond_151

    .line 1091
    :try_start_14e
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_151
    .catch Ljava/io/IOException; {:try_start_14e .. :try_end_151} :catch_155

    .line 1094
    :cond_151
    :goto_151
    throw v13

    .line 1092
    .restart local v6    # "i":I
    .restart local v11    # "recordCount":I
    :catch_152
    move-exception v13

    goto/16 :goto_a6

    .end local v6    # "i":I
    .end local v11    # "recordCount":I
    :catch_155
    move-exception v14

    goto :goto_151
.end method
